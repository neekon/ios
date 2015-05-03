//
//  EventCell.swift
//  Neekon
//
//  Created by Mohsen Azimi on 5/2/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import SnapKit

class EventCell: UITableViewCell {
    
    var event: EventObject?
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var timeAndLocation: UILabel!
    
    let startTimeFormatter = NSDateFormatter()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clearColor()
        
        startTimeFormatter.dateStyle = .NoStyle
        startTimeFormatter.timeStyle = .ShortStyle
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateEvent(event event_: EventObject) {
        
        self.event = event_
        
        println(event!)
        
        title.text = event!.title!
        
        // TODO guard against invalid URLs
        eventImage.contentMode = .ScaleAspectFill
        eventImage.clipsToBounds = true
        eventImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: event!.image!)!)!)
        
        let durationInHours = Int(event!.duration!) / 60;
        let formattedStartTime = startTimeFormatter.stringFromDate(event!.startTime!)
        timeAndLocation.text = "Starts at \(formattedStartTime) (\(durationInHours) hours)"
    }
    
}
