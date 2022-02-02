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
        ZStack {
            Map(coordinateRegion: $model.region)
            Circle()
                .fill(Color.blue)
                .frame(width: 20.0, height: 20.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
