//
//  Flight.swift
//  WayAirLines
//
//  Created by Gabriel Eduardo on 07/10/24.
//

struct Flight: Codable, Identifiable {
    var flight_id: String
    var status: String
    var start_date: String
    var end_date: String
    var departure_time: String
    var arrival_time: String
    var departure_airport: String
    var arrival_airport: String
    var airplane_name: String
    
    var id: String { flight_id }
}
