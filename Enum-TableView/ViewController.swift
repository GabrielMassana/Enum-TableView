//
//  ViewController.swift
//  Enum-TableView
//
//  Created by GabrielMassana on 08/07/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Accessors
    
    /**
     Table view to display the sign up chat.
     */
    lazy var tableView: UITableView = {
        
        let tableView: UITableView = UITableView(frame: UIScreen.mainScreen().bounds)
        
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = 80.0
        
        return tableView
    }()
    
    var dataArray: [Vehicle] = {
       
        let bike = Vehicle(type: .Bike, wheels: 2)
        let car = Vehicle(type: .Car, wheels: 4)
        let truck = Vehicle(type: .Truck, wheels: 10)
        
        return [bike, car, truck]
    }()
    
    //MARK: - ViewLifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(tableView)

        registerCells()
    }
    
    //MARK: - RegisterCells
    
    /**
     Register the cells to be used in the table view.
     */
    func registerCells() {
        
        tableView.registerClass(BikeCell.self,
                                forCellReuseIdentifier: NSStringFromClass(BikeCell.self))
        
        tableView.registerClass(CarCell.self,
                                forCellReuseIdentifier: NSStringFromClass(CarCell.self))
        
        tableView.registerClass(TruckCell.self,
                                forCellReuseIdentifier: NSStringFromClass(TruckCell.self))
    }
    
    //MARK: - ConfigureCell

    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath, vehicle: Vehicle) {
        
        let type: VehicleType = vehicle.type
        
        type.configureCellForVehicleType(cell, vehicle: vehicle)
    }
}

extension ViewController: UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let vehicle = dataArray[indexPath.row]
        let type: VehicleType = vehicle.type

        let cell = type.cellForVehicleType(tableView, indexPath: indexPath)
        
        configureCell(cell, indexPath: indexPath, vehicle: vehicle)
        
        return cell
    }
}

