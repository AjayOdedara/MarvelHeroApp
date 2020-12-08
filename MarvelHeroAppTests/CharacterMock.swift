//
//  CharacterMock.swift
//  MarvelHeroAppUITests
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation
@testable import MarvelHeroApp

struct CharacterMock {
    static var instance: Character {
        return Character(name: "Ajay",
                         characterDescription: "",
                         thumbnail: Thumbnail(path: "abc", extension: "png"),
                         comicsInfo: Comics(available: 1, collectionURI: URL(string: "http://abc.com")!),
                         seriesInfo: Series(available: 1, collectionURI: URL(string: "http://abc.com")!))
    }
    
    static let comicMockUrl = "http://gateway.marvel.com/v1/public/comics/8948"
    
}

