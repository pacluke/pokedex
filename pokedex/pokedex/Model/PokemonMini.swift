//
//  File.swift
//  pokedex
//
//  Created by Lucas Flores on 03/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation

public class PokemonMini {
        let pokemonName: String
        let pokemonURL: String
    
        public init(pokemonName: String, pokemonURL: String){
            self.pokemonName = pokemonName
            self.pokemonURL = pokemonURL
        }
    
        public func description() -> String {
            return "Type: \(self.pokemonName) \n URL: \(self.pokemonURL)"
        }
}
