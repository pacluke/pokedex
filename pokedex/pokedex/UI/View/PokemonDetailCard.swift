//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Lucas Flores on 07/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonDetailCard: UIView {
    
    // mutable items
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonFrontImage: UIImageView!
    @IBOutlet weak var pokemonBackImage: UIImageView!
    @IBOutlet weak var ability01Label: UILabel!
    @IBOutlet weak var ability02Label: UILabel!
    @IBOutlet weak var ability03Label: UILabel!
    @IBOutlet weak var type01Label: UILabel!
    @IBOutlet weak var type02Label: UILabel!
    
    // static items
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.5
        
        // mutable items
        self.pokemonIdLabel = self.setupCountLabel(label: pokemonIdLabel, fontSize: 20, textDark: true, whiteBackground: true)
        self.pokemonNameLabel = self.setupCountLabel(label: pokemonNameLabel, fontSize: 25, textDark: false, whiteBackground: false)
        self.pokemonWeightLabel = self.setupCountLabel(label: pokemonWeightLabel, fontSize: 17, textDark: true, whiteBackground: true)
        self.pokemonHeightLabel = self.setupCountLabel(label: pokemonHeightLabel, fontSize: 17, textDark: true, whiteBackground: true)
//        self.pokemonFrontImage
//        self.pokemonBackImage
        self.ability01Label = self.setupCountLabel(label: ability01Label, fontSize: 20, textDark: true, whiteBackground: true)
        self.ability02Label = self.setupCountLabel(label: ability02Label, fontSize: 20, textDark: true, whiteBackground: true)
        self.ability03Label = self.setupCountLabel(label: ability03Label, fontSize: 20, textDark: true, whiteBackground: true)
        self.type01Label = self.setupCountLabel(label: type01Label, fontSize: 20, textDark: true, whiteBackground: true)
        self.type02Label = self.setupCountLabel(label: type02Label, fontSize: 20, textDark: true, whiteBackground: true)

        // static items
        self.weightLabel = self.setupCountLabel(label: weightLabel, fontSize: 17, textDark: false, whiteBackground: false)
        self.heightLabel = self.setupCountLabel(label: heightLabel, fontSize: 17, textDark: false, whiteBackground: false)
        self.abilitiesLabel = self.setupCountLabel(label: abilitiesLabel, fontSize: 20, textDark: false, whiteBackground: false)
        self.typesLabel = self.setupCountLabel(label: typesLabel, fontSize: 20, textDark: false, whiteBackground: false)
    }
    
    private func setupCountLabel(label: UILabel, fontSize: CGFloat, textDark: Bool, whiteBackground: Bool) -> UILabel{
        label.font = label.font.withSize(fontSize)
        if !textDark {
            label.textColor = UIColor.white
        }
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.layer.cornerRadius = 5
        if whiteBackground {
            label.layer.backgroundColor = UIColor.white.cgColor
        }
        label.layer.masksToBounds = false
        return label
    }
    
    private func setupClearLabel(label: UILabel) -> UILabel {
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.text = " "
        return label
    }
    
    func setCard(pokemon: Pokemon){
        
        self.pokemonIdLabel.text = pokemon.pokemonId
        self.pokemonNameLabel.text = pokemon.pokemonName
        self.pokemonWeightLabel.text = pokemon.pokemonWeight
        self.pokemonHeightLabel.text = pokemon.pokemonHeight
        
        if pokemon.pokemonAbilities.count > 0 {
            self.ability01Label.text = pokemon.pokemonAbilities[0]
        } else {
            self.ability01Label = self.setupClearLabel(label: ability01Label)
        }
        if pokemon.pokemonAbilities.count > 1  {
            self.ability02Label.text = pokemon.pokemonAbilities[1]
        } else {
            self.ability02Label = self.setupClearLabel(label: ability02Label)
        }
        if pokemon.pokemonAbilities.count > 2  {
            self.ability03Label.text = pokemon.pokemonAbilities[2]
        } else {
            self.ability03Label = self.setupClearLabel(label: ability03Label)
        }
        if pokemon.pokemonTypes.count > 0  {
            self.type01Label.text = pokemon.pokemonTypes[0]
            self.type01Label.layer.backgroundColor = UIColor().typeColor(typeName: pokemon.pokemonTypes[0]).cgColor
        } else {
            self.type01Label = self.setupClearLabel(label: type01Label)
        }
        if pokemon.pokemonTypes.count > 1  {
            self.type02Label.text = pokemon.pokemonTypes[1]
            self.type02Label.layer.backgroundColor = UIColor().typeColor(typeName: pokemon.pokemonTypes[1]).cgColor
        } else {
            self.type02Label = self.setupClearLabel(label: type02Label)
        }
        
        let frontURL = URL(string: pokemon.pokemonPhotoFrontURL)
        let backURL = URL(string: pokemon.pokemonPhotoBackURL)
        
        self.pokemonFrontImage.kf.setImage(with: frontURL)
        self.pokemonBackImage.kf.setImage(with: backURL)
        
        self.layer.backgroundColor = UIColor().typeColor(typeName: pokemon.pokemonTypes[0]).cgColor
        
    }

}
