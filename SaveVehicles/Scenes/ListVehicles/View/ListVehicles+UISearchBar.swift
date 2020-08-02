//
//  ListVehicles+UISearchBar.swift
//  SaveVehicles
//
//  Created by troquer on 8/2/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

extension ListVehiclesViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        // Place the search bar view to the tableview headerview.
        tableviewListCars.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
        filteredVehicles = cars.filter({ (user) -> Bool in
            let modelName: NSString = user.model! as NSString
            
            return (modelName.range(of: searchString ?? "", options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        // Reload the tableview.
        tableviewListCars.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tableviewListCars.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableviewListCars.reloadData()
    }
}
