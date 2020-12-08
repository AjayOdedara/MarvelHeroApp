//
//  MarvelHerosHomeViewModel.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 24/09/20.
//

import Foundation
import UIKit

class MarvelHerosHomeViewModel {
    
    var headerData:HeaderData?
    lazy var comicOffset = 0
    lazy var characterOffset = 0
    
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    let herosCells = Bindable([HerosCollectionCellTypes]())
    let comicsCells = Bindable([ComicsTableCellTypes]())
    
    var comicUrl: String?{
        didSet{
            getHeroComics(from: comicUrl!)
        }
    }
    
    // API INIT
    let appServerClient: AppServerClient
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    func getApiParams(for loadinType: LoadingCellsType) -> ApiParams {
        let timestamp = String(Date().timeIntervalSince1970 * 1000)
        return ApiParams()
            .limit(loadinType.limit)
            .hash(ts: timestamp, privateKey: APIConstants.APIKeys.privateKey, publicKey: APIConstants.APIKeys.publicKey)
            .timestamp(timestamp)
            .apikey(APIConstants.APIKeys.publicKey)
            .offset(loadinType == .comics ? comicOffset : characterOffset)
    }
    
    // MARK: - Get Characters
    func getMarvelHeros() {
        showLoadingHud.value = true
        appServerClient.getData(apiUrl: APIConstants.WebService.marvelHeros, with: getApiParams(for: .characters), data: [Character].self) { [weak self] result in
            
            switch result {
            case .failure(let error):
                self?.herosCells.value = [.empty]
                self?.showErrorAlert(error: error)
                
            case .success(let responseData):
                
                self?.herosCells.value.append(contentsOf: responseData.compactMap {
                    .normal(cellViewModel: $0 as CollectionViewHeroCellViewModel)
                })

                self?.showLoadingHud.value = false
                if self?.characterOffset == 0{
                    self?.headerData = HeaderData(headerTitle: responseData.first?.hero.name,
                                                  comicCount: responseData.first?.hero.comicsInfo.available)
                    self?.comicUrl = responseData.first?.hero.comicsCollectionUrl.absoluteString ?? ""
                }
                self?.characterOffset = responseData.count
            }
        }
    }
    // MARK: - Get Characters Comics
    func getHeroComics(from url:String) {
        
        appServerClient.getData(apiUrl: url, with: getApiParams(for: .comics), data: [Comic].self) { [weak self] result in
            
            switch result {
            case .failure(let error):
                DLog(error.localizedDescription)
                self?.comicsCells.value = [.empty]
                
            case .success(let responseData):
                self?.comicOffset = responseData.count
                self?.comicsCells.value.append(contentsOf: responseData.compactMap {
                    .normal(cellViewModel: $0 as TableViewCellComicsInfoViewModel)
                })
                
            }
        }
    }
    
    func showErrorAlert(error: Error){
        let alert = SingleButtonAlert(title: MarvelConstants.AlertView.alertTitle,
                                      message: error.localizedDescription,
                                      action: AlertAction(buttonTitle: MarvelConstants.AlertView.alertOkayButtonTitle, handler: {
                                        DLog("Alert action clicked")
                                      }))
        self.onShowError?(alert)
    }
    
    
}
// MARK: - Table & Collection Paging
extension MarvelHerosHomeViewModel{
    
    func isLastIndexOfTable(index: Int) -> Bool {
        return comicsCells.value.count - 1 == index
    }
    
    func isLastIndexOfCollection(index: Int) -> Bool {
        return herosCells.value.count - 1 == index
    }
    func countCellSizeForIndexPath() -> CGSize {
        let cellPadding = MarvelConstants.CollectionView.cellPadding
        let itemsPerRow = MarvelConstants.CollectionView.itemsPerRow
        let rowPadding = cellPadding * CGFloat( ( itemsPerRow  +  Int(cellPadding) ) - 1)
        let availableSpace = UIWindow().screen.bounds.width - rowPadding
        // Dimension Calculation
        let itemDimension = availableSpace/CGFloat(itemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension + 50)
    }
}
