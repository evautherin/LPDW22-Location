//
//  SettingsView.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2022.
//

import SwiftUI
import MapKit

struct SettingsView: View {
    @EnvironmentObject var model: ViewModel
    @State var coordinateRegion = MKCoordinateRegion(
        center: LocationService.shared.userLocation.value,
        latitudinalMeters: 500.0,
        longitudinalMeters: 500.0
    )
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $coordinateRegion)
            Circle()
                .fill(Color.blue)
                .frame(width: 20.0, height: 20.0)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(ViewModel())
    }
}

//let region = CLCircularRegion(
//    center: model.settingsCoordinateRegion.center,
//    radius: 150.0,
//    identifier: "Bridge"
//)
