//
//  CollectionViewHeroCell.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 24/09/20.
//

import Foundation

protocol CollectionViewHeroCellViewModel {
    var hero: Character { get }
    var thumbnaiilUrl: URL? { get }
}

extension Character: CollectionViewHeroCellViewModel {
    var hero: Character {
        return self
    }
    var thumbnaiilUrl: URL? {
        let thumbnailURL = URL(string: hero.thumbnail.urlPath(type: .portraitIncredible))
        return thumbnailURL
    }
}
