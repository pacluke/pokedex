//
//  PokemonDetailViewController.swift
//  pokedex
//
//  Created by Lucas Flores on 05/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit
import SwiftOverlays

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonDetailCard: PokemonDetailCard!
    
    // data
    var pokemonMiniData: PokemonMini!
    var pokemon: Pokemon!
    
    // controller
    let pokemonController = PokemonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Pokémon detail"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.showWaitOverlay()
        self.pokemonDetailCard.isHidden = true
        self.pokemonController.getPokemonData(url: pokemonMiniData.pokemonURL) { pokemon in
            self.removeAllOverlays()
            self.pokemonDetailCard.setCard(pokemon: pokemon)
            self.pokemonDetailCard.isHidden = false
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
