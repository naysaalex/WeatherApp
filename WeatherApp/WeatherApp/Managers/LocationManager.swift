//
//  LocationManager.swift
//  WeatherSampleApp
//
//  Created by naysa alex.
//


import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager() //instance of CLLocationManager instance
    
    //published location and isLoading so other views can see the changes
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    //initialize the LocationManager class and set CLLocationManager delegate to self
    override init() {
        super.init()
        manager.delegate = self
    }
    
    //function with request the device's current location
    func requestLocation() {
        isLoading = true //set to true to indicate the location request is in progress
        manager.requestLocation() //call requestLocation function to get the current location
    }
    
    //location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last?.coordinate //last known location to update the location variable
        isLoading = false //set to false to indicate the location request is complete
    }
    
    //function is called if an error arrives while getting the location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Eror getting location", error) //prints error message
        isLoading = false //indicates the location request is complete
    }
}
