//
//  ScheduleViewController.swift
//  Neekon
//
//  Created by Mohsen Azimi on 1/25/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class ScheduleViewController: UITableViewController, UITableViewDelegate, UIAlertViewDelegate, UINavigationControllerDelegate {
    
    var events = [EventObject]()
    
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
    
        
        let nib = UINib(nibName: "EventCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "EventCell")
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.separatorStyle = .None
        tableView.allowsSelection = true
        
        EventObject.fetchEventObjects { (events: [EventObject]!, error: NSError!) in
            self.events = events
            self.tableView.reloadData()
        }
    }
    
    // - TableView Data
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventCell
        
        cell.updateEvent(event: events[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let event = events[indexPath.row]
        let details = EventDetailsViewController()
        details.event = event
        
        navigationController?.pushViewController(details, animated: true)
    }
}
