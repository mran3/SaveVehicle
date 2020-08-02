//
//  ListCarsViewController.swift
//
//
//  Created by mran3 on 2/8/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

class ListCarsViewController: UIViewController {
    
    @IBOutlet var tableviewListCars: UITableView!
    var cars:[Vehicles] = []
    var filteredVehicles:[Vehicles] = []
    var searchController: UISearchController!
    var shouldShowSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewListCars.register(UINib(nibName: "CellVehicle", bundle: nil), forCellReuseIdentifier: "CellVehicleID")
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cars = DatabaseController.getAllUsers()
        tableviewListCars.reloadData()
    }
    
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
}

extension ListCarsViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
        filteredVehicles = cars.filter({ (user) -> Bool in
            let userName: NSString = user.model! as NSString
            
            return (userName.range(of: searchString ?? "", options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
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

extension ListCarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (shouldShowSearchResults) ? filteredVehicles.count : cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellVehicleID", for: indexPath) as! CellVehicle
        let car = (shouldShowSearchResults) ? filteredVehicles[indexPath.row] : cars[indexPath.row]
        if let name = car.model {
            cell.labelModel.text = "Model: " + name
        }
        if let price = car.price {
            cell.labelPrice.text = "Price: $" + price
        }
        if let seats = car.seats {
            cell.labelSeats.text = "Seats: " + seats
        }
        if let condition = car.condition {
            cell.labelCondition.text = "Condition: " + condition
        }
        if let category = car.category {
            cell.labelCategory.text = "Category: " + category
        }
        return cell
    }
    
    
}
