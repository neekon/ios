//
//  ScheduleObject.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/11/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class ScheduleObject : PFObject {
    var eventDateAndTime : NSDate?
    var fbEventLink : NSString?
    var location: NSString?
}