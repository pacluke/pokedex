//
//  PokemonType.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation
import UIKit.UIColor

public class PokemonType {
    let typeName: String
    let typeURL: String
    let typePokemons: [PokemonMini]
    let typePokemonsCount: String
    let effetiveAgainst: [String]
    let vulnerableTo: [String]
    
    public init(typeName: String, typeURL: String, typePokemons: [PokemonMini], effetiveAgainst: [String], vulnerableTo: [String]){
        self.typeName = typeName
        self.typeURL = typeURL
        self.typePokemons = typePokemons
        self.typePokemonsCount = "\(typePokemons.count) x"
        self.effetiveAgainst = effetiveAgainst
        self.vulnerableTo = vulnerableTo
    }
    
    public func description() -> String {
        return "Type: \(self.typeName) \n URL: \(self.typeURL)"
    }
}
