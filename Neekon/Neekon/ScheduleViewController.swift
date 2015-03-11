//
//  ScheduleViewController.swift
//  Neekon
//
//  Created by Mohsen Azimi on 1/25/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class ScheduleViewController: UIViewController {

    @IBAction func calendarButtonPressed(sender: AnyObject) {
        
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
