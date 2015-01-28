//
//  FirstViewController.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/9/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit
import Parse

class NewsViewController: UITableViewController {
    var news : [NewsObject]?

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
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let definiteNews = self.news {
            return definiteNews.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
}

