//
//  MarvelHerosModel.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 23/09/20.
//

import Foundation
typealias Codable = Decodable & Encodable

enum TableCellContentType: Int{
    case heros
    case information
    static let count: Int = {
        var max: Int = 0
        while let _ = TableCellContentType(rawValue: max) { max += 1 }
        return max
    }()
}

enum LoadingCellsType {
    case characters
    case comics
    
    var limit: Int{
        switch self {
        case .characters:
            return MarvelConstants.ContentLoadingLimit.collectionCharacterCellLimit
        case .comics:
            return MarvelConstants.ContentLoadingLimit.tableComicCellLimit
        }
    }
}

enum HerosCollectionCellTypes {
    case normal(cellViewModel: CollectionViewHeroCellViewModel)
    case error(message: String)
    case empty
}

enum ComicsTableCellTypes {
    case normal(cellViewModel: TableViewCellComicsInfoViewModel)
    case error(message: String)
    case empty
}
