//
//  MapViewController.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/9/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import MapKit
import Parse

class MapViewController: UIViewController {
    
    var eventInfoObject:EventInfoObject?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleImage = UIImage(named: "navigation-top-bar-logo")
        let titleView = UIImageView(image: titleImage)
        titleView.frame = CGRectMake(0, 0, 150, 40)
        titleView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.navigationItem.titleView = titleView
        
        self.view.backgroundColor = UIColor.clearColor()

        EventInfoObject.fetchEventInfoObject { (eventInfoObject, error) -> Void in
            if (error == nil) {
                self.eventInfoObject = eventInfoObject;
                self.updateAddress()
            }
        }
    }

    @IBAction func didTapGetDirection(sender: AnyObject) {
        if let address = eventInfoObject?.locationName {
            if let escaped = address.stringByAddingPercentEscapesUsingEncoding(NSStringEncoding()) {
                if let url = NSURL(string: "http://maps.apple.com/?daddr=\(escaped)") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAddress() {
        if let address = eventInfoObject?.locationName {
            addressLabel.text = "\(address)"
        } else {
            addressLabel.text = ""
        }
    }
    
//    func updateMap() {
//        
//        let address = schedule.objectForKey("location") as NSString
//        let latitude = schedule.objectForKey("latitude") as NSString
//        let longitude = schedule.objectForKey("longitude") as NSString
//        
//        let coordinates = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude.doubleValue) , longitude: CLLocationDegrees(longitude.doubleValue))
//        let region = MKCoordinateRegionMakeWithDistance(coordinates, 3000, 3000)
//        let adjustedRegion = mapView.regionThatFits(region)
//        
//        // Add pin
//        let point = MKPointAnnotation()
//        point.coordinate = coordinates
//        mapView.addAnnotation(point)
//
//        mapView.setRegion(region, animated: true)
//        mapView.showsUserLocation = true
//    }

}

