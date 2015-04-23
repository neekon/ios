//
//  ArtistObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import Foundation
import Parse

class ArtistObject : PFObject, PFSubclassing {
    @NSManaged var name: String?
    @NSManaged var photo_url: String?
    @NSManaged var bio: String?
    @NSManaged var website: String?
    @NSManaged var twitter_id: String?
    @NSManaged var facebook_id: String?
    @NSManaged var instagram_id: String?

    override class func initialize() {
        superclass()?.initialize()
        self.registerSubclass()
    }
    class func parseClassName() -> String {
        return "Artist"
    }
    
    class func fetchArtistObjects(resultsBlock: ([ArtistObject]!, NSError!) -> Void) {
        let query = ArtistObject.query()
        query?.findObjectsInBackgroundWithBlock { (results:[AnyObject]?, error:NSError?) -> Void in
            if (error != nil) {
                // TODO: show error
                resultsBlock(nil, error)
            } else {
                if let objects = results{
                    var artistObjects = [ArtistObject]()
                    for artistObject in objects as! [ArtistObject] {
                        artistObjects.append(artistObject)
                    }
                    resultsBlock(artistObjects, nil)
                }
            }
        }
    }
}
