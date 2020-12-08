//
//  APIConstants.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation
struct APIConstants {
    
    static let baseUrl = "https://gateway.marvel.com:443/v1/public"
    public struct WebService {
        static let marvelHeros = APIConstants.baseUrl + "/characters?"
    }
    
    public struct APIKeys {
        static let publicKey = "f6f6d68190e79e7d86fa572fd3c9586e"
        static let privateKey = "773d07d57b7f574fb25d72c61b0186e672dd46b3"
    }
    
}
