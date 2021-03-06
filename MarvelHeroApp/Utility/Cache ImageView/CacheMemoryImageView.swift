//
//  CacheMemoryImageView.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation
import UIKit

class CacheMemoryImageView: UIImageView {
    
    private var urlKey: String! = nil
    let appServerClient: AppServerClient = {
        return AppServerClient.sharedInstance
    }()
    
    /**
     * Load with url and set the image to imageView.
     * if place holder true it will show place holder untill image loading
     - Parameter atURL: Url of the Image
     - Parameter placeHolder: blank place holder image till image loading
     */
    func loadImage(atURL url: URL, placeHolder: Bool = true, completion: (() -> Void)? = nil) {
        self.urlKey = url.absoluteString
        if let cachedImage = CachedMemoryManager.shared.retrieveCachedImage(for: urlKey) {
            completion?()
            self.image = cachedImage
            return
        } else {
            if placeHolder {
                // TODO: Put place holder image
                self.image = UIImage(named: "placeHolder")
            }
            appServerClient.download(fromURL: url) {[weak self, url] (data, error) in
                guard error == nil, let data = data else {
                    completion?()
                    return
                }
                if let image = UIImage(data: data) {
                    //Cache image for future use
                    CachedMemoryManager.shared.cacheImage(image, forKey: url.absoluteString)
                    DispatchQueue.main.async {
                        completion?()
                        if url.absoluteString == self?.urlKey {
                            self?.image = image
                        }
                    }
                } else {
                    completion?()
                }
            }
        }
    }
}
