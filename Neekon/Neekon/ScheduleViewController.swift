//
//  ScheduleViewController.swift
//  Neekon
//
//  Created by Mohsen Azimi on 1/25/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import EventKit
import Parse

class ScheduleViewController: UIViewController, UIAlertViewDelegate {

    @IBAction func calendarButtonPressed(sender: UIButton) {
        let store = EKEventStore()
        store.requestAccessToEntityType(EKEntityTypeEvent) { (granted:Bool, error:NSError!) in
            if granted {
                let event = EKEvent(eventStore: store)
                event.startDate = NSDate()
                event.allDay = true
                event.endDate = event.startDate.dateByAddingTimeInterval(24 * 60 * 60)
                event.title = "Neekon"
                event.location = "San Francisco"
                event.calendar = store.defaultCalendarForNewEvents
                var error:NSError?
                store.saveEvent(event, span: EKSpanThisEvent, commit: true, error: &error)
                
                let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
                
                dispatch_async(dispatch_get_main_queue()) {
             
                    activityIndicator.frame = CGRect(
                        x: self.view.frame.width / 2,
                        y: self.view.frame.height / 2,
                        width: 40,
                        height: 40)
                
                    self.view.addSubview(activityIndicator)
                    activityIndicator.startAnimating()
                
                }
            
                dispatch_async(dispatch_get_main_queue()) {
                    let alert = UIAlertView(title: "Success!", message: "This event was successfully added to your calendar", delegate: self, cancelButtonTitle: "OK")
                    if error != nil {
                        alert.title = "Failure!"
                        alert.message = "There was a problem adding this event to your calendar"
                    }
                    activityIndicator.stopAnimating()
                    activityIndicator.hidden = true
                    alert.show()
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
