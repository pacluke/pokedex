//
//  File.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

class PokemonTypeCell: UITableViewCell {
    
    @IBOutlet weak var pokemonTypeViewBehind: UIView!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    
    @IBOutlet weak var pokemonStrongAgainstNameLabel: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel01: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel02: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel03: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel04: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel05: UILabel!
    
    @IBOutlet weak var pokemonVunerableToNameLabel: UILabel!
    @IBOutlet weak var pokemonVunerableToLabel01: UILabel!
    @IBOutlet weak var pokemonVunerableToLabel02: UILabel!
    @IBOutlet weak var pokemonVunerableToLabel03: UILabel!
    @IBOutlet weak var pokemonVunerableToLabel04: UILabel!
    @IBOutlet weak var pokemonVunerableToLabel05: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.pokemonTypeViewBehind = self.setupViewBehind(view: pokemonTypeViewBehind)
        self.pokemonTypeLabel = self.setupLabel(label: pokemonTypeLabel)
        
        self.pokemonStrongAgainstNameLabel = self.setupCountLabel(label: pokemonStrongAgainstNameLabel)
        self.pokemonStrongAgainstLabel01 = self.setupCountLabel(label: pokemonStrongAgainstLabel01)
        self.pokemonStrongAgainstLabel02 = self.setupCountLabel(label: pokemonStrongAgainstLabel02)
        self.pokemonStrongAgainstLabel03 = self.setupCountLabel(label: pokemonStrongAgainstLabel03)
        self.pokemonStrongAgainstLabel04 = self.setupCountLabel(label: pokemonStrongAgainstLabel04)
        self.pokemonStrongAgainstLabel05 = self.setupCountLabel(label: pokemonStrongAgainstLabel05)

        self.pokemonVunerableToNameLabel = self.setupCountLabel(label: pokemonVunerableToNameLabel)
        self.pokemonVunerableToLabel01 = self.setupCountLabel(label: pokemonVunerableToLabel01)
        self.pokemonVunerableToLabel02 = self.setupCountLabel(label: pokemonVunerableToLabel02)
        self.pokemonVunerableToLabel03 = self.setupCountLabel(label: pokemonVunerableToLabel03)
        self.pokemonVunerableToLabel04 = self.setupCountLabel(label: pokemonVunerableToLabel04)
        self.pokemonVunerableToLabel05 = self.setupCountLabel(label: pokemonVunerableToLabel05)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView(view: UIView) -> UIView{
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 5.0)
        return view
    }
    
    private func setupViewBehind(view: UIView) -> UIView{
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowOpacity = 0.5
        return view
    }
    
    private func setupLabel(label: UILabel) -> UILabel{
        label.font = label.font.withSize(25)
        label.textColor = UIColor.white
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        return label
    }
    
    private func setupCountLabel(label: UILabel) -> UILabel{
        label.font = label.font.withSize(15)
        label.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = false
        return label
    }
    
    private func setupPokemonLabel(label: UILabel) -> UILabel{
        label.font = label.font.withSize(10)
        return label
    }
}
