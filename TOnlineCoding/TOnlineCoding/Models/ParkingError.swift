//
//  ParkingError.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import Foundation

public enum ParkingError: Error {
    
    case carWasNotParkedHere
    case carNumberIsMissing
    case carHasAlreadyBeenParked
}

public enum RateCalculatorError: Error {
    
    case exitTimeBeforeEntryTime
    case exitTimeNotSet
    case invalidRate
}
