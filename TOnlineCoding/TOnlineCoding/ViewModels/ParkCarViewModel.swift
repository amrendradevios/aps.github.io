//
//  ParkViewModel.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import Observation
import Foundation

@Observable
public final class ParkCarViewModel {
    
    public let carNumberPlaceholder: String = "Please enter car number"
    public let carNamePlaceholder: String = "Please enter car name"
    public let driverLicence: String = "Has driver local licence?"
    public var carName: String = ""
    public var carNumber: String = ""
    public var isLocalDriver: Bool = false

    public var carNumberErrorMessage: String = ""

    private let parkingLot: Parking
    
    
    public init(parkingLot: Parking) {
        self.parkingLot = parkingLot
    }
    
    func enter() {
        guard carNumber.isEmpty == false else {
            carNumberErrorMessage = "Car number can't be empty"
            return
        }
        
        let car = Car(id: carNumber, name: carName, driver: CarDriver(isLocal: isLocalDriver))
        
        do {
            _ = try parkingLot.enter(car: car)
        } catch {
            carNumberErrorMessage = "Car number has already been parked here"
        }
    }
}
