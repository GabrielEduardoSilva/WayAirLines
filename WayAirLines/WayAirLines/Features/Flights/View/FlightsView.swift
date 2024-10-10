//
//  ContentView.swift
//  WayAirLines
//
//  Created by Gabriel Eduardo on 07/10/24.
//

import SwiftUI

struct FlightsView: View {
    @StateObject var viewModel = FlightsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Teste", selection: $viewModel.selectedFlightStatus){
                    ForEach(FlightStatus) { selected in
                        Text()
                    }
                }
                .font(.system(size: 28))
                .padding()
                ScrollView {
                    ForEach(viewModel.flights) { flight in
                        Text(flight.airplane_name)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Voos")
            .searchable(text: $viewModel.searchText)
            .onAppear {
                viewModel.fetchFlights()
            }
        }
        
    }
}

#Preview {
    FlightsView()
}
