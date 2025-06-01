//
//  TOnlineCodingApp.swift
//  TOnlineCoding
//
//  Created by Amrendra singh on 01/06/25.
//

import SwiftUI

@main
struct TOnlineCodingApp: App {
    var body: some Scene {
        WindowGroup {
            CarkParkingView(viewModel: CarViewModel(
                parkLot: ParkingLot(
                    config: ParkignFareConfiguration(
                        hourlyRate: 10,
                        overnightRate: 20,
                        freeHoursForLocal: 3
                    ),
                    calculator: RateCalculator()
                )
            ))
        }
    }
}
