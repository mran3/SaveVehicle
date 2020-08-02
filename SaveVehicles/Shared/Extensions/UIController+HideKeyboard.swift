//
//  UIController+HideKeyboard.swift
//  SaveVehicle
//
//  Created by mran3 on 8/1/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
