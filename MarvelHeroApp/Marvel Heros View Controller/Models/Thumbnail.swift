//
//  Thumbnail.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 27/09/20.
//

import UIKit

struct Thumbnail: Codable {
    
    var path: String
    var `extension`: String
    
    func urlPath(type: ThumbnailType)-> String {
        return "\(path)/\(type.rawValue).\(`extension`)"
    }
}
