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
    @NSManaged var title: String?
    @NSManaged var content: String?
    @NSManaged var imageUrl: String?
    
    override class func load() {
        superclass()?.load()
        self.registerSubclass()
    }
    class func parseClassName() -> String! {
        return "News"
    }
    
    class func fetchNewsObjects(resultsBlock: ([NewsObject]!, NSError!) -> Void) {
        let query = NewsObject.query()
        query.findObjectsInBackgroundWithBlock { (results:[AnyObject]!, error:NSError?) -> Void in
            if (error != nil) {
                // TODO: show error
                resultsBlock(nil, error)
            } else {
                if let objects = results {
                    var newsObjects = [NewsObject]()
                    for newsObject in objects as [NewsObject] {
                        println("news: \(newsObject.title) content: \(newsObject.content)")
                        newsObjects.append(newsObject)
                    }
                    resultsBlock(newsObjects, nil)
                }
            }
        }

    }
    
}
