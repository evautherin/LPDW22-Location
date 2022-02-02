//
//  LocationService.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2022.
//

import Foundation
import CoreLocation


class LocationService: NSObject, CLLocationManagerDelegate {
    var model: ViewModel?
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func start(model: ViewModel) {
        self.model = model
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        
    }
}


extension LocationService {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch (locationManager.authorizationStatus) {
        case .notDetermined: break
        case .restricted: break
        case .denied: print("denied")
        case .authorizedAlways: print("authorizedAlways")
        case .authorizedWhenInUse: print("authorizedWhenInUse")
        @unknown default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        locations.forEach({ location in
            model?.region.center = location.coordinate
        })
    }
}
