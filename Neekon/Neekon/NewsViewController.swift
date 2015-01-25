//
//  FirstViewController.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/9/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    var news = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithNewsItems(newsItems: NSArray) {
        
    }

    func fetchNews() {
        let query = PFQuery(className: "News")
        query.findObjectsInBackgroundWithBlock { (newsResult:[AnyObject]!, error:NSError?) -> Void in
            if (error != nil) {
                self.news = newsResult
            } else {
                // TODO: Show
            }
        }
    }
}

