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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
