//
//  Vehicle.swift
//  Enum-TableView
//
//  Created by GabrielMassana on 08/07/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import Foundation

struct Vehicle {
    
    var type: VehicleType
    var wheels: Int
    
    init(type: VehicleType, wheels: Int) {
        
        self.type = type
        self.wheels = wheels
    }
}