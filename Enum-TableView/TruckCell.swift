//
//  TruckCell.swift
//  Enum-TableView
//
//  Created by GabrielMassana on 08/07/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import UIKit

class TruckCell: UITableViewCell {

    //MARK: - ConfigureCell

    func configureWithVehicle(vehicle: Vehicle) {
        
        textLabel?.text = "\(vehicle.type.rawValue): \(vehicle.wheels)"
        textLabel?.textAlignment = .Center
        self.contentView.backgroundColor = UIColor.orangeColor()
    }
}
