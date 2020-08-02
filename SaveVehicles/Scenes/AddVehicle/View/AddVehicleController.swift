//
//  AddVehicleController.swift
//  SaveVehicle
//
//  Created by mran3 on 8/1/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit
import CoreData

class AddVehicleController: UIViewController {
    
    @IBOutlet weak var textPrice: UITextField!
    @IBOutlet weak var textModel: UITextField!
    @IBOutlet weak var conditionPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var textSeats: UITextField!
    
    var conditionData: [String] = [String]()
    var categoryData: [String] = [String]()
    var selectedCategory = ""
    var selectedCondition = ""
    private let presenter = AddVehiclePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        
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
    
    func showErrorAlert(message:String) {
        showAlert(with: message, title: "Error Alert")
    }
    
    @IBAction func handlerToAddVehicle(_ sender: Any) {
        presenter.saveNewVehicle()
        self.navigationController?.popViewController(animated: true)
    }
    
}
