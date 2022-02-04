//
//  LocationView.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2022.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $model.userCoordinateRegion)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20.0, height: 20.0)
            }
//            .toolbar {
//                Button {
//                    print("Geofencing")
//                } label: {
//                    Image(systemName: "circle.dashed")
//                }
//                
//            }
            .onAppear(perform: {
                LocationService.shared.start(model: model)
            })
            .onDisappear(perform: {
                LocationService.shared.stop()
        })
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(ViewModel())
    }
}
