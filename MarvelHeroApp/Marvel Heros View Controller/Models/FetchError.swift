//
//  FetchError.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 24/09/20.
//

import Foundation

enum FetchError: Error {
    case invalidJSON
    case invalidURL
    case networkFailed
    case limite
}
