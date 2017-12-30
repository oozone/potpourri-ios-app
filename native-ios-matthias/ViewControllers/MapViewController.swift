//
//  MapViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 28/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var locManager = CLLocationManager()
    var hogentLocation: CLLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup HoGent location
        let lat: CLLocationDegrees = 51.0337537
        let long: CLLocationDegrees = 3.699018
        let longDelta: CLLocationDegrees = 0.005
        let latDelta = longDelta
        let coordinateSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        hogentLocation = CLLocation(latitude: lat,longitude: long)
        
        // Setup our map
        let coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(center: hogentLocation.coordinate, span: coordinateSpan)
        mapView.setRegion(coordinateRegion, animated: true)
        
        // Add annotation
        let annot = MKPointAnnotation()
        annot.title = "HoGent"
        annot.subtitle = "Hier heb ik les"
        annot.coordinate = hogentLocation.coordinate
        mapView.addAnnotation(annot)
        
        // Location Manager to get distance
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Did update location? -> set the distance between you and hogent
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        
        let distance = userLocation.distance(from: hogentLocation)
        
        distanceLabel.text = String(format: "%.2f", distance / 1000)
        
    }

}

extension MapViewController: MKMapViewDelegate {
    
}
