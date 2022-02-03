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
    @Published var userCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        latitudinalMeters: 100.0,
        longitudinalMeters: 100.0
    )
    
//    init() {
//        locationService.start(model: self)
//    }
}
