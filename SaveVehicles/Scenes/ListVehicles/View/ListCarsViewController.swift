//
//  ListCarsViewController.swift
//
//
//  Created by mran3 on 2/8/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

class ListVehiclesViewController: UIViewController {
    
    @IBOutlet var tableviewListCars: UITableView!
    var cars:[Vehicles] = []
    var filteredVehicles:[Vehicles] = []
    var searchController: UISearchController!
    var shouldShowSearchResults = false
    private var presenter = ListVehiclesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewListCars.register(UINib(nibName: "CellVehicle", bundle: nil), forCellReuseIdentifier: "CellVehicleID")
        configureSearchController()
        presenter.viewController = self
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tableviewListCars.contentInset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        presenter.getAllVehicles()
    }
    
    func vehiclesLoaded(vehicles:[Vehicles]) {
        cars = vehicles
        tableviewListCars.reloadData()
    }
    
}
