//
//  LocationObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class LocationObject : PFObject, PFSubclassing {
    @NSManaged var name : String?
    @NSManaged var image: String?
    @NSManaged var latitude: String?
    @NSManaged var longitude: String?
    @NSManaged var locationType: String?
    
    override class func initialize() {
        superclass()?.initialize()
        self.registerSubclass()
    }
    
    class func parseClassName() -> String {
        return "Location"
    }
    
    class func fetchLocationObjects(resultsBlock: ([LocationObject]!, NSError!) -> Void) {
        let query = LocationObject.query()
        query?.findObjectsInBackgroundWithBlock { (results:[AnyObject]?, error:NSError?) -> Void in
            if (error != nil) {
                // TODO: show error
                resultsBlock(nil, error)
            } else {
                if let objects = results{
                    var locationObjects = [LocationObject]()
                    for locationObject in objects as! [LocationObject] {
                        locationObjects.append(locationObject)
                    }
                    resultsBlock(locationObjects, nil)
                }
            }
        }
        
    }
}