//
//  EnumType.swift
//  Enum-TableView
//
//  Created by GabrielMassana on 08/07/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import UIKit

enum VehicleType: String {
    
    case Bike
    case Car
    case Truck
    
    //MARK: - Cell

    func cellForVehicleType(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        
        switch self {
            
        case Bike:
            
            return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(BikeCell.self), forIndexPath: indexPath) as! BikeCell
            
        case Car:
            
            return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(CarCell.self), forIndexPath: indexPath) as! CarCell

        case Truck:
            
            return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(TruckCell.self), forIndexPath: indexPath) as! TruckCell
        }
    }
    
    //MARK: - ConfigureCell

    func configureCellForVehicleType(cell: UITableViewCell, vehicle: Vehicle) {
        
        switch self {
            
        case .Bike:
            
            let cell = cell as! BikeCell
            cell.configureWithVehicle(vehicle)
            
        case .Car:
            
            let cell = cell as! CarCell
            cell.configureWithVehicle(vehicle)
            
        case .Truck:
            
            let cell = cell as! TruckCell
            cell.configureWithVehicle(vehicle)
        }
    }
}
