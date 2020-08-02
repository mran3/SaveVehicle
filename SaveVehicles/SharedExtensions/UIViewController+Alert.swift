//
//  UIViewController+Alert.swift
//  SaveVehicle
//
//  Created by mran3 on 8/1/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
