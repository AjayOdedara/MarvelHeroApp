//
//  TableViewInfoCellViewModel.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 27/09/20.
//

import Foundation


protocol TableViewCellComicsInfoViewModel {
    var comic: Comic { get }
    var thumbnaiilUrl: URL? { get }
}

extension Comic: TableViewCellComicsInfoViewModel {
    var comic: Comic {
        return self
    }
    var thumbnaiilUrl: URL? {
        let thumbnailURL = URL(string: comic.thumbnail.urlPath(type: .portraitFantastic))
        return thumbnailURL
    }
}
