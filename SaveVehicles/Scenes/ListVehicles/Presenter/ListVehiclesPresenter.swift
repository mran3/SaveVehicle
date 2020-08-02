//
//  ListVehiclesPresenter.swift
//  SaveVehicles
//
//  Created by troquer on 8/2/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import Foundation

class ListVehiclesPresenter {
    weak var viewController: ListVehiclesViewController?
    
    func getAllVehicles(){
        viewController?.vehiclesLoaded(vehicles: VehiclesModel.getAllVehicles())
    }
    
}
