//
//  ScheduleViewController.swift
//  Neekon
//
//  Created by Mohsen Azimi on 1/25/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI
import Parse

class ScheduleViewController: UIViewController, UIAlertViewDelegate, EKEventEditViewDelegate, UINavigationControllerDelegate {

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
                        controller.delegate = self
                        
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

    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        alertView.dismissWithClickedButtonIndex(buttonIndex, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let titleImage = UIImage(named: "navigation-top-bar-logo")
        let titleView = UIImageView(image: titleImage)
        titleView.frame = CGRectMake(0, 0, 150, 40)
        titleView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.navigationItem.titleView = titleView
        
        self.view.backgroundColor = UIColor.clearColor()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
