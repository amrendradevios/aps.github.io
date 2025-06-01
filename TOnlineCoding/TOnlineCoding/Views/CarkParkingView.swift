//
//  CarkParkingView.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import SwiftUI


public struct CarkParkingView: View {
    
    @Bindable var viewModel: CarViewModel
    @State private var path: [String] = []
    
    
    public var body: some View {
        NavigationStack {
            List(viewModel.cars) { car in
                HStack {
                    Text(car.name)
                        .font(.headline)
                    Spacer()
                    Button("Exit") {
                        viewModel.exitCar(car: car)
                    }
                }.cornerRadius(10).padding()
            }.navigationTitle("Cars")
                .toolbarRole(.navigationStack)
                .toolbar {
                    Button("Park car") {
                        viewModel.refreshParkedCars()
                       // path.append("park")
                    }
                }
                .navigationDestination(for: String.self) { value in
                    if value == "park" {
                        CarParkEntryView(viewModel: ParkCarViewModel(parkingLot: viewModel.parkLot), path: $path)
                    }
                }
        }
        .onAppear {
            viewModel.refreshParkedCars()
        }
    }
}

#Preview {
    CarkParkingView(
        viewModel: CarViewModel(
            parkLot: ParkingLot(
                config: ParkignFareConfiguration(
                    hourlyRate: 10,
                    overnightRate: 20,
                    freeHoursForLocal: 3
                ),
                calculator: RateCalculator()
            )
        )
    )
}
