//
//  PartEntryView.swift
//  TCGPlayerLiveCodingRound
//
//  Created by Amrendra singh on 01/06/25.
//

import SwiftUI


public struct CarParkEntryView: View {

    @Bindable var viewModel: ParkCarViewModel
    @Binding var path: [String]

    public var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField(viewModel.carNamePlaceholder, text: $viewModel.carName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
               
                TextField(viewModel.carNumberPlaceholder, text: $viewModel.carNumber)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                
                Toggle(viewModel.driverLicence, isOn: $viewModel.isLocalDriver)
                
                Button(action: {
                    viewModel.enter()
                    path.removeAll()
                }) {
                    Text("Park").foregroundStyle(.white)
                        .frame(width: 200, height: 48)
                }.background(viewModel.carNumber.isEmpty ? Color.gray : Color.blue)
                    .disabled(viewModel.carNumber.isEmpty)
            }.padding().navigationTitle("Parking Car Details")
        }
    }
}

#Preview {
    CarParkEntryView(
        viewModel: ParkCarViewModel(
            parkingLot: ParkingLot(
                config: ParkignFareConfiguration(
                    hourlyRate: 10,
                    overnightRate: 20,
                    freeHoursForLocal: 3
                ),
                calculator: RateCalculator()
            )
        ), path: Binding<[String]>(get: { [] }, set: { _ in })
    )
}
