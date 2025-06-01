//
//  ParkingLot.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import Foundation
import Observation

public actor ParkingLot: @preconcurrency Parking {
    
    private var parkedCars: [String: ParkingTicket] = [:]
    private let config: ParkignFareConfiguration
    private let calculator: ParkignRateCalculator
    
    public init(config: ParkignFareConfiguration, calculator: ParkignRateCalculator) {
        self.config = config
        self.calculator = calculator
    }
    
    public func getParkedCars() -> [Car] {
        parkedCars.compactMap { $0.value.car }
    }
    
    public func enter(car: Car) throws -> ParkingTicket {
        if parkedCars[car.id] != nil {
            throw ParkingError.carHasAlreadyBeenParked
        }
        let ticket = ParkingTicket(car: car, entryDate: Date(), exitDate: nil, totalHours: 0, isOvernight: false, totalCharge: 0.0)
        parkedCars[car.id] = ticket
        return ticket
    }
    
    public func exit(car: Car) throws -> ParkingTicket {
        guard var ticket = parkedCars[car.id] else {
            throw ParkingError.carWasNotParkedHere
        }
        ticket.exitDate = Date()
        do {
            let finalTicket = try calculator.calculateRate(for: ticket, with: config)
            parkedCars.removeValue(forKey: car.id)
            return finalTicket
        } catch {
            throw error
        }
    }
}
