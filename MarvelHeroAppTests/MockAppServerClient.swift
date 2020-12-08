//
//  MockAppServerClient.swift
//  MarvelHeroAppTests
//
//  Created by Ajay Odedra on 27/09/20.
//

import Foundation
@testable import MarvelHeroApp

class MockAppServerClient<T>: AppServerClient {
    enum OverrideType {
        case getCharacter
        case comics
    }
    
}
