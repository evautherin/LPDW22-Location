//
//  LocationService.swift
//  Location
//
//  Created by Etienne Vautherin on 02/02/2022.
//

import Foundation
import Combine
import CoreLocation


class LocationService: NSObject, CLLocationManagerDelegate {
    static let shared = LocationService()
    let userLocation = CurrentValueSubject<CLLocationCoordinate2D, Never>(CLLocationCoordinate2D(latitude: 0, longitude: 0))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func start(model: ViewModel) {
        locationManager.requestAlwaysAuthorization()
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }
    
    func startGeofencing(region: CLCircularRegion) {
        region.notifyOnExit = true
        region.notifyOnEntry = true
        locationManager.startMonitoring(for: region)
    }

    
    func stopGeofencing() {
        
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
            userLocation.send(location.coordinate)
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion \(region.identifier)")
    }
}
