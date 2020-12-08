//
//  HashGenerator.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation

struct HashGenerator {
    
    static func hash(ts: String, privateKey: String, publicKey: String) -> String {
        return "\(ts)\(privateKey)\(publicKey)".md5()
    }
    
}
