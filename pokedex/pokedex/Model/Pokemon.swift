//
//  Pokemon.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation

public class Pokemon {
    let pokemonName: String
    let pokemonId: String
    let pokemonWeight: String
    let pokemonHeight: String
    let pokemonAbilities : [String]
    let pokemonTypes : [String]
    let pokemonPhotoFrontURL: String
    let pokemonPhotoBackURL: String
    
    public init(pokemonName: String, pokemonId: Int, pokemonWeight: Float, pokemonHeight: Float, pokemonAbilities: [String], pokemonTypes: [String], pokemonPhotoFrontURL: String, pokemonPhotoBackURL: String){
        self.pokemonName = pokemonName.capitalizingFirstLetter()
        self.pokemonId = "#" + pokemonId.description
        self.pokemonWeight = (pokemonWeight / 10.0).description + "kg"
        self.pokemonHeight = (pokemonHeight / 10.0).description + "m"
        self.pokemonAbilities = pokemonAbilities
        self.pokemonTypes = pokemonTypes
        self.pokemonPhotoFrontURL = pokemonPhotoFrontURL
        self.pokemonPhotoBackURL = pokemonPhotoBackURL
    }
    
    public func description() -> String {
        return "Pokémon: \(self.pokemonName) \n Id: \(self.pokemonId.description) \n Weight: \(self.pokemonWeight) \n Height: \(self.pokemonHeight) \n Abilities: \(self.pokemonAbilities) \n Types: \(self.pokemonTypes) \n Front photo URL: \(self.pokemonPhotoFrontURL) \n Back photo URL: \(self.pokemonPhotoBackURL)"
    }
}
