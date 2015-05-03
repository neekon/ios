//
//  MapViewController.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/9/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import MapKit
import Parse
import EventKit
import EventKitUI

private let formatter = NSDateFormatter()


class MapViewController: UIViewController, EKEventEditViewDelegate {
    
    var eventInfoObject:EventInfoObject?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set formatter style
        formatter.timeStyle = .NoStyle
        formatter.dateStyle = .LongStyle
        
        let titleImage = UIImage(named: "navigation-top-bar-logo")
        let titleView = UIImageView(image: titleImage)
        titleView.frame = CGRectMake(0, 0, 150, 40)
        titleView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.navigationItem.titleView = titleView
        
        self.view.backgroundColor = UIColor.clearColor()

        EventInfoObject.fetchEventInfoObject { (eventInfoObject, error) -> Void in
            if (error == nil) {
                self.eventInfoObject = eventInfoObject;

                self.dateLabel.text = formatter.stringFromDate(eventInfoObject.eventDate!)
                self.locationLabel.text = eventInfoObject.locationName
            }
        }
    }
    
    @IBAction func calendarButtonPressed(sender: UIButton) {
        let store = EKEventStore()
        store.requestAccessToEntityType(EKEntityTypeEvent) { (granted:Bool, error:NSError!) in
            if granted {
                EventInfoObject.fetchEventInfoObject({ (eventInfo, error) -> Void in
                    if (error == nil) {
                        let event = EKEvent(eventStore: store)
                        event.startDate = eventInfo.eventDate
                        event.allDay = true
                        event.endDate = eventInfo.eventDate?.dateByAddingTimeInterval(24 * 60 * 60)
                        event.title = eventInfo.eventName
                        event.location = eventInfo.locationName
                        event.calendar = store.defaultCalendarForNewEvents
                        
                        let controller = EKEventEditViewController()
                        
                        controller.event = event
                        controller.eventStore = store
                        controller.editViewDelegate = self
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            self.presentViewController(controller, animated: true, completion: {})
                        }
                    }
                })
            }
        }
    }
    
    func eventEditViewController(controller: EKEventEditViewController!, didCompleteWithAction action: EKEventEditViewAction) {
        controller.dismissViewControllerAnimated(true, completion: {})
    }

    @IBAction func didTapGetDirection(sender: AnyObject) {
        if let address = eventInfoObject?.locationName {
            if let escaped = address.stringByAddingPercentEscapesUsingEncoding(NSStringEncoding()) {
                if let url = NSURL(string: "http://maps.apple.com/?daddr=\(escaped)") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
        
    }

}

