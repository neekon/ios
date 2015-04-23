//
//  EventObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class EventObject : PFObject, PFSubclassing {
    @NSManaged var startTime : NSDate?
    @NSManaged var eventType : String?
    @NSManaged var title : String?
    @NSManaged var subtitle : String?
    @NSManaged var image : String?
    @NSManaged var duration : NSNumber?
    @NSManaged var eventDescription : String?
    @NSManaged var location : LocationObject?
    @NSManaged var artists : [ArtistObject]?
    
    override class func initialize() {
        superclass()?.initialize()
        self.registerSubclass()
    }
    
    class func parseClassName() -> String {
        return "Event"
    }
    
    class func fetchEventObjects(resultsBlock: ([EventObject]!, NSError!) -> Void) {
        let query = EventObject.query()
        query?.findObjectsInBackgroundWithBlock { (results:[AnyObject]?, error:NSError?) -> Void in
            if (error != nil) {
                // TODO: show error
                resultsBlock(nil, error)
            } else {
                if let objects = results{
                    var eventObjects = [EventObject]()
                    for eventObject in objects as! [EventObject] {
                        eventObjects.append(eventObject)
                    }
                    resultsBlock(eventObjects, nil)
                }
            }
        }
        
    }
}