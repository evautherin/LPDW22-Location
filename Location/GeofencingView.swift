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
    
    var body: some View {
        VStack{
            TextField("Name of your region", text: $model.name)
            Text("Meter: \(Int(model.meter))")
            Slider(value: $model.meter, in: 100...10000, step: 100)
            Toggle("Geofencing", isOn: $model.geofencing)
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
