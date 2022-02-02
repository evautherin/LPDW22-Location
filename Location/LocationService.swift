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
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.startUpdatingLocation()
        
        let region = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: 37.33434427635175, longitude: -122.04146513231953),
            radius: 150.0,
            identifier: "Bridge"
        )
        region.notifyOnExit = true
        region.notifyOnEntry = true
        locationManager.startMonitoring(for: region)
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
//        print(locations)
        
        locations.forEach({ location in
            model?.region.center = location.coordinate
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnter \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion \(region.identifier)")
    }
}
