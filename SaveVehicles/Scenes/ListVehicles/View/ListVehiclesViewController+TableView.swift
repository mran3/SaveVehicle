//
//  ListVehiclesViewController+TableView.swift
//  SaveVehicles
//
//  Created by troquer on 8/2/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

extension ListVehiclesViewController: UITableViewDataSource {
    
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
