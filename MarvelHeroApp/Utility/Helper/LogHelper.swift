//
//  LogHelper.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//
import Foundation

func DLog(_ message: String, function: String = #function) {
    #if DEBUG
        NSLog("%@, %@", function, message)
    #endif
}
