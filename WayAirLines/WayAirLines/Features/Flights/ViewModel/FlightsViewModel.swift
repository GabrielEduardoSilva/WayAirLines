//
//  FlightsViewModel.swift
//  WayAirLines
//
//  Created by Gabriel Eduardo on 07/10/24.
//

import SwiftUI

class FlightsViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var apiManager: APIManager = APIManager()
    @Published var flights: [Flight] = []
    @Published var selectedFlightStatus: FlightStatus = .todos
    
    func fetchFlights() {
        apiManager.fetchFlights { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let flights):
                    self.flights = flights
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                }
            }
        }
    }
}
