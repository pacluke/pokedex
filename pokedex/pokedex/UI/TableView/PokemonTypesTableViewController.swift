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
        cell.pokemonStrongAgainstView01.setTypeView(types: effectiveAgainst, index: 0)
        cell.pokemonStrongAgainstLabel02.setTypeLabel(types: effectiveAgainst, index: 1)
        cell.pokemonStrongAgainstView02.setTypeView(types: effectiveAgainst, index: 1)
        cell.pokemonStrongAgainstLabel03.setTypeLabel(types: effectiveAgainst, index: 2)
        cell.pokemonStrongAgainstView03.setTypeView(types: effectiveAgainst, index: 2)
        cell.pokemonStrongAgainstLabel04.setTypeLabel(types: effectiveAgainst, index: 3)
        cell.pokemonStrongAgainstView04.setTypeView(types: effectiveAgainst, index: 3)
        cell.pokemonStrongAgainstLabel05.setTypeLabel(types: effectiveAgainst, index: 4)
        cell.pokemonStrongAgainstView05.setTypeView(types: effectiveAgainst, index: 4)
        
        cell.pokemonVunerableToLabel01.setTypeLabel(types: vulnerableTo, index: 0)
        cell.pokemonVunerableToView01.setTypeView(types: vulnerableTo, index: 0)
        cell.pokemonVunerableToLabel02.setTypeLabel(types: vulnerableTo, index: 1)
        cell.pokemonVunerableToView02.setTypeView(types: vulnerableTo, index: 1)
        cell.pokemonVunerableToLabel03.setTypeLabel(types: vulnerableTo, index: 2)
        cell.pokemonVunerableToView03.setTypeView(types: vulnerableTo, index: 2)
        cell.pokemonVunerableToLabel04.setTypeLabel(types: vulnerableTo, index: 3)
        cell.pokemonVunerableToView04.setTypeView(types: vulnerableTo, index: 3)
        cell.pokemonVunerableToLabel05.setTypeLabel(types: vulnerableTo, index: 4)
        cell.pokemonVunerableToView05.setTypeView(types: vulnerableTo, index: 4)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonList" {
            let pokemonListView = segue.destination as! PokemonsTableViewController
            let selectedRow = self.tableView.indexPathForSelectedRow!.row
            pokemonListView.pokemonMiniData = typesData[selectedRow]
        }
    }
}

extension UIView{
    func setTypeView(types: [String], index: Int){
        if types.count > index {
            self.layer.backgroundColor = UIColor().typeColor(typeName: types[index]).cgColor
        }
        else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
}

extension UILabel{
    func setTypeLabel(types: [String], index: Int){
        if types.count > index {
            self.text = types[index]
            self.textColor = UIColor.white
        }
        else {
            self.text = ""
        }
    }
}
