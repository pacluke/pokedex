//
//  PokemonTypesTableViewController.swift
//  pokedex
//
//  Created by Lucas Flores on 02/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit
import SwiftOverlays

extension PokemonTypesTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class PokemonTypesTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    private let pokemonTypeController = PokemonTypeController()
    private var typesData: [PokemonType] = []
    private var filteredTypes:[PokemonType] = []
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showWaitOverlay()
        pokemonTypeController.getPokemonTypesData { data in
            self.typesData = data
            self.tableView.reloadData()
            self.removeAllOverlays()
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // search bar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search types"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.tintColor = UIColor.white
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Pokédex"
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.89, green:0.21, blue:0.05, alpha:1.0)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    // MARK: - Table view data source
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredTypes = typesData.filter({( type : PokemonType) -> Bool in
            return type.typeName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredTypes.count
        }
        return typesData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTypeCell", for: indexPath) as! PokemonTypeCell
        
        let type: PokemonType
        
        if isFiltering() {
            type = self.filteredTypes[indexPath.row]
        } else {
            type = self.typesData[indexPath.row]
        }
        
        
        // Configure the cell...\
        let cellColor = UIColor().typeColor(typeName: type.typeName).cgColor
        
        cell.pokemonTypeLabel?.text = type.typeName
//        cell.pokemonCountLabel?.text = type.typePokemonsCount
        cell.pokemonTypeViewBehind.layer.backgroundColor = cellColor
            
        let effectiveAgainst = type.effetiveAgainst
        let vulnerableTo = type.vulnerableTo

        cell.pokemonStrongAgainstLabel01.setTypeLabel(types: effectiveAgainst, index: 0)
        cell.pokemonStrongAgainstLabel02.setTypeLabel(types: effectiveAgainst, index: 1)
        cell.pokemonStrongAgainstLabel03.setTypeLabel(types: effectiveAgainst, index: 2)
        cell.pokemonStrongAgainstLabel04.setTypeLabel(types: effectiveAgainst, index: 3)
        cell.pokemonStrongAgainstLabel05.setTypeLabel(types: effectiveAgainst, index: 4)
        
        cell.pokemonVunerableToLabel01.setTypeLabel(types: vulnerableTo, index: 0)
        cell.pokemonVunerableToLabel02.setTypeLabel(types: vulnerableTo, index: 1)
        cell.pokemonVunerableToLabel03.setTypeLabel(types: vulnerableTo, index: 2)
        cell.pokemonVunerableToLabel04.setTypeLabel(types: vulnerableTo, index: 3)
        cell.pokemonVunerableToLabel05.setTypeLabel(types: vulnerableTo, index: 4)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedRow = self.tableView.indexPathForSelectedRow!.row
        let type: PokemonType
        
        if isFiltering() {
            type = self.filteredTypes[selectedRow]
        } else {
            type = self.typesData[selectedRow]
        }
        
        if segue.identifier == "PokemonList" {
            let pokemonListView = segue.destination as! PokemonsTableViewController
            pokemonListView.pokemonMiniData = type
        }
    }
}

extension UILabel{
    func setTypeLabel(types: [String], index: Int){
        if types.count > index {
            self.text = types[index]
            self.textColor = UIColor.white
            self.layer.backgroundColor = UIColor().typeColor(typeName: types[index]).cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        }
        else {
            self.text = " "
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
}
