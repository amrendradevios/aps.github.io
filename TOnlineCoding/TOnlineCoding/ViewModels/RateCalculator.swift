//
//  RateCalculator.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//
import Foundation

public struct RateCalculator: ParkignRateCalculator {
    
    public func calculateRate(for carTicket: ParkingTicket, with fareRate: ParkignFareConfiguration) throws -> ParkingTicket {
        guard let exitDate = carTicket.exitDate else {
            throw RateCalculatorError.exitTimeNotSet
        }
        let entryDate = carTicket.entryDate
        let totalHours = try calculateHours(from: entryDate, to: exitDate)
        let isOvernight = isOvernightParking(entry: entryDate, exit: exitDate)
        let charge = calculateCharge(for: carTicket, hoursParked: totalHours, isOvernight: isOvernight, fareRate: fareRate)
        return ParkingTicket(car: carTicket.car, entryDate: entryDate, totalHours: totalHours, isOvernight: isOvernight, totalCharge: charge)
    }
    
    private func calculateHours(from entry: Date, to exit: Date) throws -> Int {
        guard exit > entry else {
            throw RateCalculatorError.exitTimeBeforeEntryTime
        }
        let components = Calendar.current.dateComponents([.hour], from: entry, to: exit)
        return max(components.hour ?? 0, 1) // at least 1 hour
    }
    
    private func isOvernightParking(entry: Date, exit: Date) -> Bool {
        return !Calendar.current.isDate(entry, inSameDayAs: exit)
    }
    
    private func calculateCharge(for carTicket: ParkingTicket, hoursParked: Int, isOvernight: Bool, fareRate: ParkignFareConfiguration) -> Double {
        
        var billableHours = hoursParked
        if carTicket.car.driver.isLocal {
            billableHours = max(0, hoursParked - fareRate.freeHoursForLocal)
        }
        
        var totalCharge = Double(billableHours) * fareRate.hourlyRate
        
        if isOvernight {
            totalCharge += fareRate.overnightRate
        }
        return totalCharge
    }
}
