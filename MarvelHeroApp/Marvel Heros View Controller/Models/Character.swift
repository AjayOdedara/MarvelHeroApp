//
//  Character.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 24/09/20.
//

import Foundation

struct Character: Codable {
    
    let name: String
    let characterDescription: String
    let thumbnail: Thumbnail
    let comicsInfo: Comics
    let seriesInfo: Series
    var comics: [Comic] = []
    var series: [Serie] = []
    
    var comicsCollectionUrl: URL {
        return comicsInfo.collectionURI
    }
    
    var seriesCollectionUrl: URL {
        return seriesInfo.collectionURI
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, thumbnail
        case characterDescription = "description"
        case comicsInfo = "comics"
        case seriesInfo = "series"
    }
}
