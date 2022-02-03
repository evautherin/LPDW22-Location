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
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $model.userCoordinateRegion)
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
