//
//  LocationViewController.swift
//  The Board Game For Me
//
//  Created by Alex Harris on 12/5/19.
//  Copyright © 2019 Crap Apps. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation


class LocationViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
    
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            
            
       
        }
 
 }
