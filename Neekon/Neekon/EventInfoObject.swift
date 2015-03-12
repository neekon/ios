//
//  ScheduleObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class EventInfoObject : PFObject, PFSubclassing {
    @NSManaged var eventDate : NSDate?
    @NSManaged var eventName : String?
    @NSManaged var locationName: String?
    @NSManaged var locationCity: String?
    @NSManaged var latitude: String?
    @NSManaged var longitude: String?
    
    override class func load() {
        superclass()?.load()
        self.registerSubclass()
    }

    class func parseClassName() -> String! {
        return "EventInfo"
    }

    class func fetchEventInfoObject(resultsBlock: (EventInfoObject!, NSError!) -> Void) {
        let query = EventInfoObject.query()
        query.findObjectsInBackgroundWithBlock { (results:[AnyObject]!, error:NSError?) -> Void in
            if (error != nil) {
                // TODO: show error
                resultsBlock(nil, error)
            } else {
                if let objects = results {
                    var newsObjects = [EventInfoObject]()
                    for newsObject in objects as [EventInfoObject] {
                        resultsBlock(newsObject, nil)
                        return
                    }
                }
            }
        }
        
    }
}