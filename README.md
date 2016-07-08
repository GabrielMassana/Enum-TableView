# Enum-TableView

The principal idea here is to move out of cellForRowAtIndexPath the switch who handles which cell are we dequeuing each time. 

As data for the array I'm using an array of struct Vehicle. One of the values of the struct is VehicleType.

```objc
struct Vehicle {
    
    var type: VehicleType
    var wheels: Int
    
    init(type: VehicleType, wheels: Int) {
        
        self.type = type
        self.wheels = wheels
    }
}
```

VehicleType is an enum for diferent types of vehicles: Bike, Car and truck.

```objc
enum VehicleType: String {
    
    case Bike
    case Car
    case Truck
}
```

The app has three Cells: BikeCell, CarCell and TruckCell.

My usual Objective-C code translated to Swift will be something like:

```objc

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let vehicle = dataArray[indexPath.row]

        var cell: UITableViewCell
        
        switch vehicle.type {
            
        case .Bike:
            
            cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(BikeCell.self),
                                                               forIndexPath: indexPath) as! BikeCell
            
        case .Car:
            
            cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(CarCell.self),
                                                               forIndexPath: indexPath) as! CarCell
            
        case .Truck:
            
            cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(TruckCell.self),
                                                               forIndexPath: indexPath) as! TruckCell
        }
        
        configureCell(cell, indexPath: indexPath, vehicle: vehicle)

        return cell
    }
```

However, moving the switch code to the Enum:

```objc

enum VehicleType: String {
    
    case Bike
    case Car
    case Truck
    
    //MARK: - Cell

    func cellForVehicleType(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        
        switch self {
            
        case Bike:
            
            return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(BikeCell.self), 
                                                               forIndexPath: indexPath) as! BikeCell
            
        case Car:
            
            return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(CarCell.self), 
                                                               forIndexPath: indexPath) as! CarCell

        case Truck:
            
            return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(TruckCell.self), 
                                                               forIndexPath: indexPath) as! TruckCell
        }
    }
}
```
It looks like:

```objc

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let vehicle = dataArray[indexPath.row]
        let type: VehicleType = vehicle.type

        let cell = type.cellForVehicleType(tableView, indexPath: indexPath)
        
        configureCell(cell, indexPath: indexPath, vehicle: vehicle)
        
        return cell
    }
    
```

I'm doing the same with configureCell. Into the Enum:

```objc
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
```

Then, the ViewController:

```objc
    //MARK: - ConfigureCell

    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath, vehicle: Vehicle) {
        
        let type: VehicleType = vehicle.type
        
        type.configureCellForVehicleType(cell, vehicle: vehicle)
    }
```
