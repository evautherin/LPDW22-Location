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
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        latitudinalMeters: 5000.0,
        longitudinalMeters: 5000.0
    )
    @State var name: String = ""
    @State var meter = 5000.0
    @State var geofencing: Bool = false
    
    var body: some View {
        VStack{
            ZStack {
                Map(coordinateRegion: $coordinateRegion)
                Circle()
                    .strokeBorder(Color.white, lineWidth: 3)
                    .frame(width: 22.0, height: 22.0)
                Rectangle()
                    .frame(width: 22, height: 2, alignment: .center)
                Rectangle()
                    .frame(width: 2, height: 22, alignment: .center)
                
            }
            VStack{
                TextField("Name of your region", text: $name)
                Text("Meter: \(Int(meter))")
                Slider(value: $meter, in: 100...10000, step: 100)
                Toggle("geofencing", isOn: $geofencing)
            }.padding()
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
