//
//  EventCell.swift
//  Neekon
//
//  Created by Mohsen Azimi on 5/2/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
//import Snap // TODO

class EventCell: UITableViewCell {
    
    var event: EventObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clearColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateEvent(event event_: EventObject) {
        
        self.event = event_
        
        let titleLabel = UILabel()
        titleLabel.text = event!.title!
        titleLabel.sizeToFit()
        addSubview(titleLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = event!.eventDescription!
        descriptionLabel.sizeToFit()
        addSubview(descriptionLabel)
        
    }
    
}
