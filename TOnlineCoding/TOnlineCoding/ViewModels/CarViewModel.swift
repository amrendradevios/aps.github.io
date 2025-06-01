//
//  CarViewModel.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import SwiftUI
import Observation

@Observable
public final class CarViewModel {
    
    public private(set) var cars: [Car] = []
    public private(set) var parkLot: Parking
    
    public init(parkLot: Parking) {
        self.parkLot = parkLot
    }

    public func exitCar(car: Car) {
        do {
            let ticket = try parkLot.exit(car: car)
            cars = parkLot.getParkedCars()
            print("Charge:", ticket.totalCharge)
        } catch {
            //log error
        }
    }

    public func refreshParkedCars() {
        createCars()
        cars = parkLot.getParkedCars()
    }
    
    func createCars() {
        let car1 = Car(id: "213344", name: "Car1", driver: CarDriver(isLocal: false))
        let car2 = Car(id: "213533", name: "Car2", driver: CarDriver(isLocal: true))
        let car3 = Car(id: "213323", name: "Car3", driver: CarDriver(isLocal: false))
        let car4 = Car(id: "213333", name: "Car4", driver: CarDriver(isLocal: true))
        let car5 = Car(id: "213633", name: "Car5", driver: CarDriver(isLocal: false))
        let car6 = Car(id: "213733", name: "Car6", driver: CarDriver(isLocal: true))
        let car7 = Car(id: "344444", name: "Car7", driver: CarDriver(isLocal: false))
        do {
           _ = try parkLot.enter(car: car1)
            _ = try parkLot.enter(car: car2)
            _ = try parkLot.enter(car: car3)
            _ = try parkLot.enter(car: car4)
            _ = try parkLot.enter(car: car5)
            _ = try parkLot.enter(car: car6)
            _ = try parkLot.enter(car: car7)
        } catch  {
            
        }
    }
}
