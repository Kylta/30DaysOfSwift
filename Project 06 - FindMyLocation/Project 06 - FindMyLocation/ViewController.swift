//
//  ViewController.swift
//  Project 06 - FindMyLocation
//
//  Created by Christophe Bugnon on 03/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var placeMark: CLPlacemark?
    var city: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLocation(locationButton)
        
    }
    
    @IBAction func startLocation(_ sender: UIButton) {

        if locationButton.isHighlighted {
        determineMyCurrentLocation()
        }
        
    }
    
    private func determineMyCurrentLocation() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
        locationManager.startUpdatingLocation()
        }
        
    }
    
    private func fetchCountryAndCity(location: CLLocation, completion: @escaping (String, String) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error \(error)")
            } else if let city = placemarks?.first?.locality, let countryCode = placemarks?.first?.isoCountryCode {
                completion(city, countryCode)
            }
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
        fetchCountryAndCity(location: location) { city, countryCode in
            self.locationLabel.text = "\(city) (\(countryCode))"
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }

}

