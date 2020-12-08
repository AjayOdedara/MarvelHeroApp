//
//  AppServerClient.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import UIKit

enum DataError: Error {
    case decodingError
    case invalidPath
    case noResponseData
    case invalidJSON
}


class AppServerClient {
    
    class var sharedInstance: AppServerClient {
        struct Static {
            static let instance: AppServerClient! = AppServerClient()
        }
        return Static.instance
    }
    
    typealias ResultBlock<T> = (Result <T, Error>) -> Void
    
    /**
     * Use to call Api with given response data type
     * Need to pass url with it's `ApiParams`
     */
    
    func getData<T: Codable>(apiUrl: String,
                             with parameters: ApiParams,
                             data responseType: [T].Type,
                             completion: @escaping ResultBlock<[T]>) {
        
        guard var components = URLComponents(string: apiUrl) else {
            return
        }
        components.queryItems = parameters.build().map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) -> Void in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = ServiceResponse(data) else {
                DispatchQueue.main.async {
                    completion(.failure(DataError.invalidJSON))
                }
                return
            }
            
            var resultList = [T]()
            let decoder = JSONDecoder()
            response.results.forEach {
                guard let jsonData = try? JSONSerialization.data(withJSONObject: $0, options: .prettyPrinted),
                      let result = try? decoder.decode(T.self, from: jsonData) else { return }
                
                resultList.append(result)
            }
            completion(.success(resultList))
            
        })
        task.resume()
    }
    
    private var downloadTasks = [URL: DownloadTask]()
    private var session: URLSession = URLSession(configuration: .default)
    /**
     * Use to download the Image from Url.
     
     - Parameter fromUrl: Takes the url of image
     */
    
    // MARK: - Image Downloader
    func download(fromURL url: URL, completion: @escaping RequestCompletionHandler) {
        if downloadTasks.keys.contains(url) {
            
            let downloadTask = downloadTasks[url]
            downloadTask?.completionHandler = completion
            // TODO: - Future Enhancement
            // downloadTask?.priority = URLSessionTask.highPriority
            
        } else {
            
            let downloadTask = session.downloadTask(with: url, completionHandler: {[weak self] (tempLocalUrl, response, error) in
                
                let completionHandler = self?.downloadTasks[url]?.completionHandler
                if self?.isSuccessResponse(response, error) ?? false, let data = self?.dataFrom(tempLocalUrl) {
                    completionHandler?(data, nil)
                } else {
                    completionHandler?(nil, error)
                }
                self?.downloadTasks.removeValue(forKey: url)
                
            })
            let task = DownloadTask(completionHandler: completion)
            downloadTasks[url] = task
            downloadTask.resume()
            
        }
    }
    private func dataFrom(_ tempLocalUrl: URL?) -> Data! {
        guard let tempLocalUrl = tempLocalUrl else {
            return nil
        }
        do {
            let data = try Data(contentsOf: tempLocalUrl)
            return data
        } catch {
            return nil
        }
        
    }
    private func isSuccessResponse(_ response: URLResponse?, _ error: Error?) -> Bool {
        
        if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...202:
                return true
            default:
                return false
            }
        } else {
            return false
        }
        
    }
    
    /**
     * Reduce the priority of the cell image which is not visible
     - Parameter withURL: It will check if contains the task of not
     */
    func reducePriorityOfTask(withURL url: URL) {
        if downloadTasks.keys.contains(url) {
            let downloadTask = downloadTasks[url]
            downloadTask?.priority = URLSessionTask.lowPriority
        }
    }
}

typealias RequestCompletionHandler = (Data?, Error?) -> Void
class DownloadTask: URLSessionTask {
    var completionHandler: RequestCompletionHandler
    init(completionHandler: @escaping RequestCompletionHandler) {
        self.completionHandler = completionHandler
    }
}

