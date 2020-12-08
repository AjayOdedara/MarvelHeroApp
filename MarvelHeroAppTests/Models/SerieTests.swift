//
//  SerieTests.swift
//  MarvelHeroAppUITests
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation

import XCTest
@testable import MarvelHeroApp

class SerieTests: XCTestCase {
    
    var serie: Serie? {
        return DecodableHelper.decode(Serie.self, dictionary: representation())
    }
    
    func testInitializationWithRepresentation() {
        XCTAssertNotNil(serie)
    }
    
    func testInitializationWithInvalidImageRepresentation() {
        let representation = [
            "title": "Ajay",
            "thumbnail": [
                "path": "path"
            ]
        ] as [String: Any]
        
        XCTAssertNil(DecodableHelper.decode(Serie.self, dictionary: representation))
    }
    
    func testTitleAndThumbnail() throws {
        let serie = try XCTUnwrap(self.serie)
        let url = URL(string: "http://www.google.com.br/standard_amazing.png")
        let portraitUrl = URL(string: "http://www.google.com.br/portrait_fantastic.png")
        
        XCTAssertTrue(serie.title == "Ajay")
        XCTAssertNotNil(serie.thumbnail.urlPath(type: .standardAmazing))
        XCTAssertTrue(serie.thumbnail.urlPath(type: .standardAmazing) == url?.absoluteString)
        XCTAssertTrue(serie.thumbnail.urlPath(type: .portraitFantastic) == portraitUrl?.absoluteString)
    }
    
    private func representation() -> [String: Any] {
        return [
            "title": "Ajay",
            "thumbnail": [
                "path": "http://www.google.com.br",
                "extension": "png"
            ]
        ] as [String: Any]
    }
}
