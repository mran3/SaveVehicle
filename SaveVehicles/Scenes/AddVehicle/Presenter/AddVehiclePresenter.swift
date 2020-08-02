//
//  AddVehiclePresenter.swift
//  SaveVehicles
//
//  Created by troquer on 8/2/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import Foundation
import CoreData

class AddVehiclePresenter {
    weak var viewController: AddVehicleController?

    
    func saveNewVehicle(){
        
        // Input validation
        guard let model = viewController?.textModel.text, model != "" else {
            viewController?.showErrorAlert(message: "Please enter model name")
            return
        }
        guard let price = viewController?.textPrice.text, price != "" else {
            viewController?.showErrorAlert(message: "Please enter price")
            return
        }
        guard let seats = viewController?.textSeats.text, seats != "" else {
            viewController?.showErrorAlert(message: "Please enter seats")
            return
        }
        guard let condition = viewController?.selectedCondition, condition != "" else {
            viewController?.showErrorAlert(message: "Please enter condition")
            return
        }
        guard let category = viewController?.selectedCategory, category != "" else {
            viewController?.showErrorAlert(message: "Please enter category")
            return
        }
        
        // Save to coredata
        let entity = NSEntityDescription.entity(forEntityName: "Vehicles", in: VehiclesModel.getContext())
        
        let newVehicle = NSManagedObject(entity: entity!, insertInto: VehiclesModel.getContext())
        newVehicle.setValue(model, forKey: "model")
        newVehicle.setValue(price, forKey: "price")
        newVehicle.setValue(seats, forKey: "seats")
        newVehicle.setValue(condition, forKey: "condition")
        newVehicle.setValue(category, forKey:"category")
        VehiclesModel.saveContext()
    }
}
