//
//  PokemonMiniCell.swift
//  pokedex
//
//  Created by Lucas Flores on 03/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit

class PokemonMiniCell: UITableViewCell {

    @IBOutlet weak var pokemonMiniView: UIView!
    @IBOutlet weak var pokemonMiniNameView: UIView!
    @IBOutlet weak var pokemonMiniNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.pokemonMiniNameLabel = self.setupLabel(label: pokemonMiniNameLabel)
        self.pokemonMiniView = self.setupView(view: pokemonMiniView)
        self.pokemonMiniNameView = self.setupNameView(view: pokemonMiniNameView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupLabel(label: UILabel) -> UILabel{
        label.font = label.font.withSize(20)
        label.textColor = UIColor.black
        return label
    }
    
    private func setupView(view: UIView) -> UIView{
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowOpacity = 0.5
        return view
    }
    
    private func setupNameView(view: UIView) -> UIView{
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        return view
    }

}
