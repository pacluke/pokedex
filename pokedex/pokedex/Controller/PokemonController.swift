//
//  PokemonController.swift
//  pokedex
//
//  Created by Lucas Flores on 05/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftOverlays
import UIKit.UIImage
import Kingfisher

public class PokemonController {
    private let pokeAPI = PokeAPI()
    
    public func getPokemonData(url: String, completion: @escaping (_ data: Pokemon) -> ()){
        self.pokeAPI.requestPokemonsInfo(url: url, completion: { response in
            let pokemonName = response["name"].string ?? ""
            let pokemonId = response["id"].int ?? 0
            let pokemonHeight = response["height"].float ?? 0.0
            let pokemonWeight = response["weight"].float ?? 0.0
            let pokemonPhotoFrontURL = response["sprites"]["front_default"].string ?? ""
            let pokemonPhotoBackURL = response["sprites"]["back_default"].string ?? ""
            let pokemonAbilities = response["abilities"].array!
            let pokemonTypes = response["types"].array!
            
            var parsedPokemonAbilities: [String] = []
            
            for ability in pokemonAbilities {
                parsedPokemonAbilities.append(ability["ability"]["name"].string?.capitalizingFirstLetter() ?? "")
            }
            
            var parsedPokemonTypes: [String] = []
            
            for type in pokemonTypes {
                parsedPokemonTypes.append(type["type"]["name"].string?.capitalizingFirstLetter() ?? "")
            }
            
            let pokemonData: Pokemon = Pokemon(pokemonName: pokemonName, pokemonId: pokemonId, pokemonWeight: pokemonWeight, pokemonHeight: pokemonHeight, pokemonAbilities: parsedPokemonAbilities, pokemonTypes: parsedPokemonTypes, pokemonPhotoFrontURL: pokemonPhotoFrontURL, pokemonPhotoBackURL: pokemonPhotoBackURL)
            
            completion(pokemonData)
            
        })
    }
    
}
