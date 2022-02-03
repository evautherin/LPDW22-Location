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
    @Published var userCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        latitudinalMeters: 500.0,
        longitudinalMeters: 500.0
    )
    var subscription: AnyCancellable?
    
    func setUserLocation(userLocation: CLLocationCoordinate2D) {
        userCoordinateRegion.center = userLocation
    }
    
    init() {
        subscription = LocationService.shared.userLocation
            .sink(receiveValue: setUserLocation)
//            .sink(receiveValue: { [weak self] userLocation in
//                self!.userCoordinateRegion.center = userLocation
//            })
    }
}
