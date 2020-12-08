//
//  MarvelConstants.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation
import UIKit

struct MarvelConstants {
    
    struct CellIdentifiers {
        static let tableViewHerosCollectionCell = "TableViewHerosCollectionCell"
        static let tableViewHeroInformationCell = "TableViewCellComicsInfo"
        static let collectionViewHeroCell = "CollectionViewHeroCell"
    }
    
    struct CollectionView {
        static let itemsPerPage = 30
        static let itemsPerRow = 3
        static let cellPadding: CGFloat = 5.0
    }
    
    struct View {
        static let navigationTitle = NSLocalizedString("character_list_navigation_bar_title", comment: "navigation title")
        static let tableHeaderPlaceHolder = NSLocalizedString("comic_list_headerView_title", comment: "Talbe view header placeholder")
    }
    
    struct AlertView {
        static let defaultMessgae = NSLocalizedString("api_failure", comment: "Default api failure message")
        static let alertTitle = NSLocalizedString("alert_error_title", comment: "Alert title for failure")
        static let alertOkayButtonTitle = NSLocalizedString("alert_okay_title", comment: "Alert okay button title for failure")
    }
    
    struct ContentLoadingLimit {
        static let tableComicCellLimit = 10
        static let collectionCharacterCellLimit = 8
    }
}
