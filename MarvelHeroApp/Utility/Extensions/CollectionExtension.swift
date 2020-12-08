//
//  CollectionExtension.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 27/09/20.
//

import Foundation
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
