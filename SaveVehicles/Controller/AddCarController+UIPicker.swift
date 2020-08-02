//
//  AddContactController+UIPicker.swift
//  Sav
//
//  Created by mran3 on 8/1/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

extension AddCarController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == conditionPicker) {
                return conditionData.count
        } else {
                return categoryData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == conditionPicker) {
                return conditionData[row]
        } else {
                return categoryData[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == conditionPicker) {
                selectedCondition = conditionData[row]
        } else {
                selectedCategory = categoryData[row]
        }
        
    }
}
