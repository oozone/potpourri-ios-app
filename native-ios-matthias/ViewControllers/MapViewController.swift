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
    var locManager = CLLocationManager()
    //var hogentLocation2D: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var hogentLocation: CLLocation = CLLocation()
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup HoGent location
        let lat: CLLocationDegrees = 51.0337537
        let long: CLLocationDegrees = 3.699018
        let longDelta: CLLocationDegrees = 0.005
        let latDelta = longDelta
        
        
        let coordinateSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        //hogentLocation2D = CLLocationCoordinate2D(latitude: lat, longitude: long)
        hogentLocation = CLLocation(latitude: lat,longitude: long)
        
        let coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(center: hogentLocation.coordinate, span: coordinateSpan)
        mapView.setRegion(coordinateRegion, animated: true)
        
        // Add annotation
        let annot = MKPointAnnotation()
        annot.title = "HoGent"
        annot.subtitle = "Hier heb ik les"
        
        annot.coordinate = hogentLocation.coordinate
        mapView.addAnnotation(annot)
        
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        
        let distance = userLocation.distance(from: hogentLocation)
        
        distanceLabel.text = String(format: "%.2f", distance / 1000)
        
    }

}

extension MapViewController: MKMapViewDelegate {
    
}
