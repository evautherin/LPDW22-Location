//
//  ContentView.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var model = ViewModel()
    
    var body: some View {
        TabView {
            LocationView(model: model)
                .tabItem {
                    Label("Location", systemImage: "location")
                }

            SettingsView(model: model)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
