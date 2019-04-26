//
//  ViewController.swift
//  Food Finder
//
//  Created by Jennifer Kwok on 3/20/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MainPageViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mainSearchBar: UISearchBar!
    @IBOutlet var mapView: MKMapView!
    
    var places: [Place] = []
    
    // tracks location
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        //TESTER FOR PINNING
        let place1 = Place("ShareTea", "2440 Bancroft Way", [:])
        place1.addLatLonManually(37.868274, -122.260437)
        places.append(place1)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        //This is supposed to make a gradient background but it isn't quite working^^
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // For mapView
        mapView.showsUserLocation = true

        
        if CLLocationManager.locationServicesEnabled() == true {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            print("Please turn on your location services on.")
        }
    }
    
    //for searchbar hiding keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //hiding keyboard after searching
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainSearchBar.resignFirstResponder()
    }
    
    //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    //        print(self.mainSearchBar.text as Any)
    //    }
    //    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    //        self.mainSearchBar.endEditing(true)
    //    }
    //

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), latitudinalMeters: 15000, longitudinalMeters: 15000)
        self.mapView.setRegion(region, animated: true)
        
        //Pinning places
        for place in places {
            let pin = Pin(title: place.name!,
                          locationName: place.locationAddress!,
                          coordinate: place.lon_lat!)
            self.mapView.addAnnotation(pin)
//
//            let artwork = Pin(title: "ShareTea",
//                              locationName: "2440 Bancroft Way",
//                              coordinate: CLLocationCoordinate2D(latitude: 37.868274, longitude: -122.260437))
//            self.mapView.addAnnotation(artwork)
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access location")
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "addPlaceSeque", sender: self)
    }

}

