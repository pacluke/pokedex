//
//  PokeAPI.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher
import SwiftyJSON

public class PokeAPI {
    let APIURL: String = "https://pokeapi.co/api/v2/"
    
    func requestPokemonTypes(completion: @escaping ([JSON]) -> ()) -> (){
        let typesURL: String = APIURL + "type/"
        
        Alamofire.request(typesURL).responseJSON{ response in
            if(response.result.value != nil) {
                let jsonResponse = JSON(response.result.value!)
                
                if let resData = jsonResponse["results"].array {
                    completion(resData)
                }
            }
        }
    }

}
