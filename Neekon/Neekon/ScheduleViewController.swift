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

class NavigationController: UINavigationController, UINavigationControllerDelegate, EKEventEditViewDelegate {
    func eventEditViewController(controller: EKEventEditViewController!, didCompleteWithAction action: EKEventEditViewAction) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}

class ScheduleViewController: UIViewController, UIAlertViewDelegate {

    @IBAction func calendarButtonPressed(sender: UIButton) {
        let store = EKEventStore()
        store.requestAccessToEntityType(EKEntityTypeEvent) { (granted:Bool, error:NSError!) in
            if granted {
                let eventInfo = EventInfoObject()
                let event = EKEvent(eventStore: store)
                event.startDate = eventInfo.eventDate
                event.allDay = true
                event.endDate = eventInfo.eventDate?.dateByAddingTimeInterval(24 * 60 * 60)
                event.title = "Neekon"
                event.location = eventInfo.locationName
                event.calendar = store.defaultCalendarForNewEvents
                
                let controller = EKEventEditViewController()
                let navigationViewController = NavigationController(rootViewController: controller)
                
                controller.event = event
                controller.eventStore = store
                controller.delegate = navigationViewController
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.presentViewController(controller, animated: true, completion: {})
                }
            }
        }
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
