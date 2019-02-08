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
        let shareButton =  UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(showShareOptions))
        self.navigationItem.rightBarButtonItem = shareButton

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.showWaitOverlay()
        self.pokemonDetailCard.isHidden = true
        self.pokemonController.getPokemonData(url: pokemonMiniData.pokemonURL) { pokemon in
            self.removeAllOverlays()
            self.pokemon = pokemon
            self.pokemonDetailCard.setCard(pokemon: self.pokemon)
            self.pokemonDetailCard.isHidden = false
        }
    }
    
    private func shareText() {
        let pokemonDescription = self.pokemon.description()
        let textToShare = [ pokemonDescription ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func shareCard() {
        UIGraphicsBeginImageContextWithOptions(self.pokemonDetailCard.frame.size, true, 0.0)
        self.pokemonDetailCard.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img!], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    @objc private func showShareOptions() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let shareText = UIAlertAction(title: "Share pokémon text", style: .default) { (action) in
            self.shareText()
        }
        let shareCard = UIAlertAction(title: "Share pokémon card", style: .default) { (action) in
            self.shareCard()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in

        }
        actionSheet.addAction(shareText)
        actionSheet.addAction(shareCard)
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
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
