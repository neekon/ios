//
//  NewsObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import Foundation
import Parse

class NewsObject : PFObject {
    var title : String = ""
    var content : String = ""
    var dateCreated : NSDate = NSDate()
}
