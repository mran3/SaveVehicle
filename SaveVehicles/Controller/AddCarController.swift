//
//  AddContactController.swift
//  SaveVehicle
//
//  Created by mran3 on 8/1/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit
import CoreData

class AddCarController: UIViewController {
    
    @IBOutlet weak var textPrice: UITextField!
    @IBOutlet weak var textModel: UITextField!
    @IBOutlet weak var conditionPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var textSeats: UITextField!
    
    var conditionData: [String] = [String]()
    var categoryData: [String] = [String]()
    var selectedCategory = ""
    var selectedCondition = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        conditionData = ["New", "Used"]
        selectedCondition = conditionData[0]
        categoryData = ["Electric", "Truck", "Commercial"]
        selectedCategory = categoryData[0]

        // Connect data:
        self.conditionPicker.delegate = self
        self.conditionPicker.dataSource = self
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        dismissKey()
    }
    
    @IBAction func handlerToAddContact(_ sender: Any) {
        
        guard let name = textModel.text, name != "" else {
            showAlert(with: "Please enter model name", title: "Error Alert")
            return
        }
        guard let price = textPrice.text, price != "" else {
            showAlert(with: "Please enter price", title: "Error Alert")
            return
        }
        
        guard let seats = textSeats.text, seats != "" else {
            showAlert(with: "Please enter seats", title: "Error Alert")
            return
        }
        guard selectedCondition != "" else {
            showAlert(with: "Please enter condition", title: "Error Alert")
            return
        }
        
        guard selectedCategory != "" else {
            showAlert(with: "Please enter category", title: "Error Alert")
            return
        }

         // Add the new contact to Core Data Context
        let entity = NSEntityDescription.entity(forEntityName: "Vehicles", in: DatabaseController.getContext())
        let newCar = NSManagedObject(entity: entity!, insertInto: DatabaseController.getContext())
        // Set the data to the entity
        newCar.setValue(name, forKey: "model")
        newCar.setValue(price, forKey: "price")
        newCar.setValue(seats, forKey: "seats")
        newCar.setValue(selectedCondition, forKey: "condition")
        newCar.setValue(selectedCategory, forKey: "category")
        // Save them to Core Data
        DatabaseController.saveContext()
        
        self.navigationController?.popViewController(animated: true)
    }
    

    
}
