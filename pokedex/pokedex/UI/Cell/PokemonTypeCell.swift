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
//    @IBOutlet weak var pokemonCountView: UIView!
//    @IBOutlet weak var pokemonCountLabel: UILabel!
    
    @IBOutlet weak var pokemonStrongAgainstNameView: UIView!
    @IBOutlet weak var pokemonStrongAgainstView01: UIView!
    @IBOutlet weak var pokemonStrongAgainstView02: UIView!
    @IBOutlet weak var pokemonStrongAgainstView03: UIView!
    @IBOutlet weak var pokemonStrongAgainstView04: UIView!
    @IBOutlet weak var pokemonStrongAgainstView05: UIView!
    
    @IBOutlet weak var pokemonStrongAgainstNameLabel: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel01: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel02: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel03: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel04: UILabel!
    @IBOutlet weak var pokemonStrongAgainstLabel05: UILabel!
    
    @IBOutlet weak var pokemonVunerableToNameView: UIView!
    @IBOutlet weak var pokemonVunerableToView01: UIView!
    @IBOutlet weak var pokemonVunerableToView02: UIView!
    @IBOutlet weak var pokemonVunerableToView03: UIView!
    @IBOutlet weak var pokemonVunerableToView04: UIView!
    @IBOutlet weak var pokemonVunerableToView05: UIView!
    
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
//        self.pokemonCountView = self.setupCountView(view: pokemonCountView)
        self.pokemonTypeLabel = self.setupLabel(label: pokemonTypeLabel)
//        self.pokemonCountLabel = self.setupPokemonLabel(label: pokemonCountLabel)

        self.pokemonStrongAgainstNameView = self.setupViewBehind(view: pokemonStrongAgainstNameView)
        self.pokemonStrongAgainstView01 = self.setupViewBehind(view: pokemonStrongAgainstView01)
        self.pokemonStrongAgainstView02 = self.setupViewBehind(view: pokemonStrongAgainstView02)
        self.pokemonStrongAgainstView03 = self.setupViewBehind(view: pokemonStrongAgainstView03)
        self.pokemonStrongAgainstView04 = self.setupViewBehind(view: pokemonStrongAgainstView04)
        self.pokemonStrongAgainstView05 = self.setupViewBehind(view: pokemonStrongAgainstView05)

        self.pokemonStrongAgainstNameLabel = self.setupCountLabel(label: pokemonStrongAgainstNameLabel)
        self.pokemonStrongAgainstLabel01 = self.setupCountLabel(label: pokemonStrongAgainstLabel01)
        self.pokemonStrongAgainstLabel02 = self.setupCountLabel(label: pokemonStrongAgainstLabel02)
        self.pokemonStrongAgainstLabel03 = self.setupCountLabel(label: pokemonStrongAgainstLabel03)
        self.pokemonStrongAgainstLabel04 = self.setupCountLabel(label: pokemonStrongAgainstLabel04)
        self.pokemonStrongAgainstLabel05 = self.setupCountLabel(label: pokemonStrongAgainstLabel05)

        self.pokemonVunerableToNameView = self.setupViewBehind(view: pokemonVunerableToNameView)
        self.pokemonVunerableToView01 = self.setupViewBehind(view: pokemonVunerableToView01)
        self.pokemonVunerableToView02 = self.setupViewBehind(view: pokemonVunerableToView02)
        self.pokemonVunerableToView03 = self.setupViewBehind(view: pokemonVunerableToView03)
        self.pokemonVunerableToView04 = self.setupViewBehind(view: pokemonVunerableToView04)
        self.pokemonVunerableToView05 = self.setupViewBehind(view: pokemonVunerableToView05)

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
        return label
    }
    
    private func setupPokemonLabel(label: UILabel) -> UILabel{
        label.font = label.font.withSize(10)
        return label
    }
}
