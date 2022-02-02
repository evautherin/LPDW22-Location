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
        Map(coordinateRegion: $model.region)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
