//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol: class{
    var delegate: LocationDelegate? { get set }
    func startUpdatingLocation()
    func refresh()
}

protocol LocationDelegate: class{
    func setLocation(location: CLLocationCoordinate2D)
}

class LocationService: NSObject {
    
    weak var delegate: LocationDelegate?
    let locationManager = CLLocationManager()
}

extension LocationService: LocationServiceProtocol {
    
    func startUpdatingLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func refresh() {
        locationManager.stopUpdatingLocation()
        locationManager.startUpdatingLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        delegate?.setLocation(location: locValue)
    }
}

