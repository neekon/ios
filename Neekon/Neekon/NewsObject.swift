//
//  NewsObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import Foundation
import Parse

class NewsObject : PFObject, PFSubclassing {
    dynamic var title : String = ""
    dynamic var content : String = ""
    dynamic var dateCreated : NSDate = NSDate()
    
    override class func load() {
        self.registerSubclass()
    }
    class func parseClassName() -> String! {
        return "NewsObject"
    }
    
//    class func newsObjectsFromParseObject(parseObjects: [PFObject]) -> [NewsObject]? {
//        
//    }
    
    class func fetchNewsObjects(resultsBlock: ([NewsObject]!, NSError!) -> Void) {
        let query = PFQuery(className: "News")
        query.findObjectsInBackgroundWithBlock { (newsResults:[AnyObject]!, error:NSError?) -> Void in
            if (error != nil) {
                // TODO: show error
            } else {
                if let newsObjects = newsResults as? [PFObject] {
                    
                }
            }
        }

    }
    
}
