//
//  PokemonsTableViewController.swift
//  pokedex
//
//  Created by Lucas Flores on 03/02/19.
//  Copyright © 2019 lucas.flores. All rights reserved.
//

import UIKit

extension PokemonsTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class PokemonsTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var pokemonMiniData: PokemonType!
    private var filteredPokemons:[PokemonMini] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = pokemonMiniData.typeName
        self.navigationController?.navigationBar.barTintColor = UIColor().typeColor(typeName: pokemonMiniData.typeName)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // search bar
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search \(pokemonMiniData.typeName.lowercased()) pokémon"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.tintColor = UIColor.white
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPokemons = pokemonMiniData.typePokemons.filter({( type : PokemonMini) -> Bool in
            return type.pokemonName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = pokemonMiniData.typeName
        self.navigationController?.navigationBar.barTintColor = UIColor().typeColor(typeName: pokemonMiniData.typeName)
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredPokemons.count
        }
        return pokemonMiniData.typePokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let typeName = pokemonMiniData.typeName
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonMini", for: indexPath) as! PokemonMiniCell
        
        let pokemon: PokemonMini
        
        if isFiltering() {
            pokemon = self.filteredPokemons[indexPath.row]
        } else {
            pokemon = self.pokemonMiniData.typePokemons[indexPath.row]
        }
        
        cell.pokemonMiniNameLabel?.text = pokemon.pokemonName
        cell.pokemonMiniView.backgroundColor = UIColor().typeColor(typeName: typeName)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedRow = self.tableView.indexPathForSelectedRow!.row
        let pokemonMini: PokemonMini
        
        if isFiltering() {
            pokemonMini = self.filteredPokemons[selectedRow]
        } else {
            pokemonMini = self.pokemonMiniData.typePokemons[selectedRow]
        }
        
        if segue.identifier == "PokemonDetail" {
            let pokemonDetailView = segue.destination as! PokemonDetailViewController
            pokemonDetailView.pokemonMiniData = pokemonMini
        }
    }

}
