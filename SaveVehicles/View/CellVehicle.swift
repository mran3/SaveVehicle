//
//  CellContact.swift
//  SaveVehicle
//
//  Created by mran3 on 2/8/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit

class CellVehicle: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelSeats: UILabel!
    @IBOutlet weak var labelCondition: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
