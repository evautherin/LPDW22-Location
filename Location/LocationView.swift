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
    
    @State var isSsettingsActive = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                ZStack {
                        Map(coordinateRegion: $model.userCoordinateRegion)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20.0, height: 20.0)
                        
                    }
                    .onAppear(perform: {
                        LocationService.shared.start(model: model)
                    })
                    .onDisappear(perform: {
                        LocationService.shared.stop()
                    })
                
                Button {
                    print("Geofencing")
                    isSsettingsActive = !isSsettingsActive
                } label: {
                    if (isSsettingsActive) {
                        Image(systemName: "xmark.circle")
                    } else {
                        Image(systemName: "circle.dashed")
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()

            }

            if (isSsettingsActive) {
                SettingsView()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(ViewModel())
    }
}
