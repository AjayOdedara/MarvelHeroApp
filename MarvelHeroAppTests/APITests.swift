//
//  CharactersViewTests.swift
//  MarvelHeroAppTests
//
//  Created by Ajay Odedra on 27/09/20.
//

import XCTest
@testable import MarvelHeroApp

class CharactersViewTests: XCTestCase {
    
    let viewModel = MarvelHerosHomeViewModel()
    
    // MARK: - Get Character
    func testGetCharacters() {
        
        let apiServerClient = AppServerClient()
        let expectHandlerCall = XCTestExpectation(description: "Character List result")
        
        apiServerClient.getData(apiUrl: APIConstants.WebService.marvelHeros, with: viewModel.getApiParams(forTpe: .characters), data: [Character].self) { result in
            
            switch result{
            case .success(_):
                expectHandlerCall.fulfill()
            case .failure(let error):
                XCTFail("Failed to get response for search string, Reason:\(error.localizedDescription )")
            }
            
        }
        wait(for: [expectHandlerCall], timeout: 4.0)
        
    }
    
    // MARK: - Get Comics
    func testGetComics() {
        
        let apiServerClient = AppServerClient()
        let expectHandlerCall = XCTestExpectation(description: "Comics List result")
        
        apiServerClient.getData(apiUrl: CharacterMock.comicMockUrl, with: viewModel.getApiParams(forTpe: .comics), data: [Comic].self) { result in
            
            switch result{
            case .success(_):
                expectHandlerCall.fulfill()
            case .failure(let error):
                XCTFail("Failed to get response for search string, Reason:\(error.localizedDescription )")
            }
            
        }
        wait(for: [expectHandlerCall], timeout: 4.0)
        
    }
    
}
