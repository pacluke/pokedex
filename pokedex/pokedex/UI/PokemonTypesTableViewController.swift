//
//  PokemonTypesTableViewController.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit

class PokemonTypesTableViewController: UITableViewController {

    private let pokemonTypeController = PokemonTypeController()
    private var typesData: [PokemonType] = []
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonTypeController.getPokemonTypesData { data in
            self.typesData = data
            self.tableView.reloadData()
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.tableView.layer.backgroundColor = UIColor.red.cgColor
//        self.tableView.backgroundColor = UIColor.red
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return typesData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTypeCell", for: indexPath) as! PokemonTypeCell
        
        let cellColor = self.typesData[indexPath.row].typeColor().cgColor
        
        // Configure the cell...
        cell.pokemonTypeLabel?.text = self.typesData[indexPath.row].typeName
        cell.pokemonTypeView.layer.backgroundColor = cellColor
        return cell
    }

}
