//
//  WayAirLinesApp.swift
//  WayAirLines
//
//  Created by Gabriel Eduardo on 07/10/24.
//

import SwiftUI

@main
struct WayAirLinesApp: App {
    let apimanager = APIManager()
    var body: some Scene {
        WindowGroup {
            FlightsView()
        }
    }
}
