//
//  CharacterTests.swift
//  MarvelHeroAppUITests
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation

import XCTest
@testable import MarvelHeroApp

class CharacterTests: XCTestCase {
    
    var character: Character? {
        return DecodableHelper.decode(Character.self, dictionary: representation())
    }
    
    func testInitializationWithRepresentation() {
        XCTAssertNotNil(character)
    }
    
    func testInitializationWithInvalidImageRepresentation() {
        let representation = [
            "name": "Ajay",
            "description": "oi",
            "thumbnail": [
                "path": "path"
            ]
        ] as [String: Any]
        
        XCTAssertNil(DecodableHelper.decode(Character.self, dictionary: representation))
    }
    
    func testNameDescriptionAndThumbnail() throws {
        let character = try XCTUnwrap(self.character)
        let url = URL(string: "http://www.google.com.br/standard_amazing.png")
        let portraitUrl = URL(string: "http://www.google.com.br/portrait_fantastic.png")
        
        XCTAssertTrue(character.name == "Ajay")
        XCTAssertTrue(character.characterDescription == "description")
        XCTAssertNotNil(character.thumbnail.urlPath(type: .portraitIncredible))
        XCTAssertTrue(character.thumbnail.urlPath(type: .standardAmazing) == url?.absoluteString)
        XCTAssertTrue(character.thumbnail.urlPath(type: .portraitFantastic) == portraitUrl?.absoluteString)
    }
    
    private func representation() -> [String: Any] {
        let representation = [
            "name": "Ajay",
            "description": "description",
            "comics": [
                "collectionURI": "http://www.google.com.br",
                "available": 1
            ],
            "series": [
                "collectionURI": "http://www.google.com.br",
                "available": 1
            ],
            "thumbnail": [
                "path": "http://www.google.com.br",
                "extension": "png"
            ]
        ] as [String: Any]
        return representation
    }
}
