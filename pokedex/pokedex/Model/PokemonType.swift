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
    
    public init(typeName: String, typeURL: String){
        self.typeName = typeName
        self.typeURL = typeURL
    }
    
    public func description() -> String {
        return "Type: \(self.typeName) \n URL: \(self.typeURL)"
    }
    
    public func typeColor() -> UIColor{
        switch self.typeName {
        case "Bug":
            return UIColor(red:0.45, green:0.62, blue:0.25, alpha:1.0)
        case "Fire":
            return UIColor(red:0.99, green:0.49, blue:0.14, alpha:1.0)
        case "Rock":
            return UIColor(red:0.64, green:0.55, blue:0.13, alpha:1.0)
        case "Flying":
            return UIColor(red:0.24, green:0.78, blue:0.94, alpha:1.0)
        case "Dark":
            return UIColor(red:0.44, green:0.44, blue:0.44, alpha:1.0)
        case "Dragon":
            return UIColor(red:0.95, green:0.43, blue:0.34, alpha:1.0)
        case "Electric":
            return UIColor(red:0.93, green:0.84, blue:0.20, alpha:1.0)
        case "Fairy":
            return UIColor(red:0.99, green:0.73, blue:0.91, alpha:1.0)
        case "Fighting":
            return UIColor(red:0.84, green:0.40, blue:0.14, alpha:1.0)
        case "Ghost":
            return UIColor(red:0.48, green:0.38, blue:0.64, alpha:1.0)
        case "Grass":
            return UIColor(red:0.61, green:0.80, blue:0.31, alpha:1.0)
        case "Ground":
            return UIColor(red:0.97, green:0.87, blue:0.25, alpha:1.0)
        case "Ice":
            return UIColor(red:0.32, green:0.77, blue:0.91, alpha:1.0)
        case "Normal":
            return UIColor(red:0.64, green:0.67, blue:0.69, alpha:1.0)
        case "Poison":
            return UIColor(red:0.64, green:0.55, blue:0.13, alpha:1.0)
        case "Psychic":
            return UIColor(red:0.95, green:0.40, blue:0.73, alpha:1.0)
        case "Shadow":
            return UIColor(red:0.33, green:0.27, blue:0.43, alpha:1.0)
        case "Steel":
            return UIColor(red:0.62, green:0.72, blue:0.72, alpha:1.0)
        case "Unknown":
            return UIColor.black
        case "Water":
            return UIColor(red:0.27, green:0.57, blue:0.77, alpha:1.0)
        default:
            return UIColor.white
        }
    }
}
