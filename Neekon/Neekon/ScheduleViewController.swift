//
//  SecondViewController.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/9/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ScheduleViewController: UIViewController {
    
    // Use a computed property for schedule to trigger updates when it's set after network calls
    var scheduleItem:PFObject!
    var schedule:PFObject! {
        set {
            scheduleItem = newValue as PFObject
            updateAddress()
            updateMap()
        }
        get {
           return scheduleItem
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSchedule()
    }

    @IBAction func didTapGetDirection(sender: AnyObject) {
        NSLog("didTapGetDirection")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchSchedule() {
        let query = PFQuery(className: "Schedule")
        query.findObjectsInBackgroundWithBlock { (results:[AnyObject]!, error:NSError?) -> Void in
            if error != nil {
                // TODO: Show Error to user
                NSLog("Failed to load Schedule object from Parse")
                NSLog(error!.localizedDescription)
                return
            }
            
            if let resultSchedule = results[0] as? PFObject {
                self.schedule = resultSchedule
            } else {
                NSLog("wrong object was fetched")
            }
        }
    }
    
    func updateAddress() {
        println("updating address")
        addressLabel.text = schedule.objectForKey("location") as NSString
    }
    
    func updateMap() {
        
    }

}

