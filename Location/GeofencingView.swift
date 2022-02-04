//
//  SettingsView.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2022.
//

import SwiftUI
import MapKit

struct GeofencingView: View {
    @EnvironmentObject var globalModel: ViewModel
    @StateObject var model = GeofencingViewModel()
    
//    @State var coordinateRegion = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
//        latitudinalMeters: 5000.0,
//        longitudinalMeters: 5000.0
//    )
    @State var name: String = ""
    @State var meter = 5000.0
    @State var geofencing = false
    
    var body: some View {
        VStack{
            TextField("Name of your region", text: $name)
            Text("Meter: \(Int(meter))")
            Slider(value: $meter, in: 100...10000, step: 100)
            Toggle("Geofencing", isOn: $geofencing)
        }.padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeofencingView().environmentObject(ViewModel())
    }
}

//let region = CLCircularRegion(
//    center: model.settingsCoordinateRegion.center,
//    radius: 150.0,
//    identifier: "Bridge"
//)
