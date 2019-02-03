//
//  PokemonTypeController.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PokemonTypeController {
    private let pokeAPI = PokeAPI()
    
    private func parseDataFromRequest(response: [JSON]) -> [PokemonType]{
        var types:[PokemonType] = []
        for type in response{
            let typeName: String = type["name"].string ?? "not found"
            let typeURL: String = type["url"].string ?? "not found"

            types.append(PokemonType(typeName: typeName, typeURL: typeURL))
        }
        return types
    }
    
    public func getPokemonTypesData(completion: @escaping (_ data: [PokemonType]) -> ()){
        pokeAPI.requestPokemonTypes { response in
            let data = self.parseDataFromRequest(response: response)
            completion(data)
        }
    }
    
}
