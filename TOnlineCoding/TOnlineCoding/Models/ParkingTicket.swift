//
//  ParkingTicket.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import Foundation

public struct ParkingTicket {
    
    public let car: Car
    public var entryDate: Date
    public var exitDate: Date?
    public let totalHours: Int
    public let isOvernight: Bool
    public let totalCharge: Double
}
