//
//  Pokemon.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation
import UIKit.UIImage

public class Pokemon {
    let pokemonName: String
    let pokemonId: Int
    let pokemonWeight: Int
    let pokemonHeight: Int
    let pokemonMoves : [String]
    let pokemonPhoto: UIImage
    
    public init(pokemonName: String, pokemonId: Int, pokemonWeight: Int, pokemonHeight: Int, pokemonMoves: [String], pokemonPhoto: UIImage){
        self.pokemonName = pokemonName
        self.pokemonId = pokemonId
        self.pokemonWeight = pokemonWeight
        self.pokemonHeight = pokemonHeight
        self.pokemonMoves = pokemonMoves
        self.pokemonPhoto = pokemonPhoto
    }
    
    public func description() -> String {
        return "Name: \(self.pokemonName) \n URL: \(self.pokemonId.description)"
    }
}
