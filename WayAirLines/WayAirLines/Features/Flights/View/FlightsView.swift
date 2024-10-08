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
                Text("Teste")
            }
            .navigationTitle("Voos")
            .searchable(text: $viewModel.searchText)
        }
        
    }
}

#Preview {
    FlightsView()
}
