//
//  ComicTests.swift
//  MarvelHeroAppUITests
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation

import XCTest
@testable import MarvelHeroApp

class ComicTests: XCTestCase {
    
    var comic: Comic? {
        return DecodableHelper.decode(Comic.self, dictionary: representation())
    }
    
    func testInitializationWithRepresentation() {
        XCTAssertNotNil(comic)
    }
    
    func testInitializationWithInvalidImageRepresentation() {
        let representation = [
            "title": "Ajay",
            "thumbnail": [
                "path": "path"
            ]
        ] as [String: Any]
        XCTAssertNil(DecodableHelper.decode(Comic.self, dictionary: representation))
    }
    
    func testTitleAndThumbnail() throws {
        let comic = try XCTUnwrap(self.comic)
        let url = URL(string: "http://www.google.com.br/standard_amazing.png")
        let portraitUrl = URL(string: "http://www.google.com.br/portrait_fantastic.png")
        
        XCTAssertTrue(comic.title == "Ajay")
        XCTAssertNotNil(comic.thumbnail.urlPath(type: .standardAmazing))
        XCTAssertTrue(comic.thumbnail.urlPath(type: .standardAmazing) == url?.absoluteString)
        XCTAssertTrue(comic.thumbnail.urlPath(type: .portraitFantastic) == portraitUrl?.absoluteString)
    }
    
    private func representation() -> [String: Any] {
        let representation = [
            "title": "Ajay",
            "thumbnail": [
                "path": "http://www.google.com.br",
                "extension": "png"
            ]
        ] as [String: Any]
        return representation
    }
}
