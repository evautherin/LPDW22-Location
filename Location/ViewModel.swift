//
//  ViewModel.swift
//  List
//
//  Created by Etienne Vautherin on 02/02/2022.
//

import SwiftUI
import Combine
import CoreLocation
import MapKit


class ViewModel: ObservableObject {
    let locationService = LocationService()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    init() {
        locationService.start(model: self)
    }
}
