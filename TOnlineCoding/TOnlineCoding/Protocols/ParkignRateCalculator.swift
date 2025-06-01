//
//  ParkignRateCalculator.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//


public protocol ParkignRateCalculator {
    
    func calculateRate(for carTicket: ParkingTicket, with fareRate: ParkignFareConfiguration) throws -> ParkingTicket
}
