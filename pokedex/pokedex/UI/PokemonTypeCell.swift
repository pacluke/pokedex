//
//  File.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit

class PokemonTypeCell: UITableViewCell {
    
    @IBOutlet weak var pokemonTypeView: UIView!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pokemonTypeView = self.setupView(view: pokemonTypeView)
        pokemonTypeLabel = self.setupLabel(label: pokemonTypeLabel)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView(view: UIView) -> UIView{
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        return view
    }
    
    private func setupLabel(label: UILabel) -> UILabel{
        label.font = label.font.withSize(25)
        label.textColor = UIColor.white
//        label.shadowColor = UIColor.black
        return label
    }
    
}
