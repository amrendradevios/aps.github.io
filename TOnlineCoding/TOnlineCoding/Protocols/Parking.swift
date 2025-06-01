//
//  Parking.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

public protocol Parking {
    
    func getParkedCars() -> [Car]
    func enter(car: Car) throws -> ParkingTicket
    func exit(car: Car) throws -> ParkingTicket
}
