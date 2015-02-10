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
        tableView.registerClass(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        tableView.contentInset = UIEdgeInsetsMake(UIApplication.sharedApplication().statusBarFrame.size.height + 5, 0, 0, 0)
        tableView.allowsSelection = false
        
        let titleImage = UIImage(named: "navigation-top-bar-logo")
        let titleView = UIImageView(image: titleImage)
        titleView.frame = CGRectMake(0, 0, 150, 40)
        titleView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.navigationItem.titleView = titleView
        
        self.view.backgroundColor = UIColor.clearColor()
        
        fetchNews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithNewsItems(newsItems: NSArray) {
        
    }
    
    func fetchNews() {
        NewsObject.fetchNewsObjects({ (newsObjects: [NewsObject]!, error: NSError!) -> Void in
            self.news = newsObjects
            self.tableView.reloadData()
        })
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let definiteNews = self.news {
            return definiteNews.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as NewsCell
        let newsObject = self.news![indexPath.row]
        cell.fill(newsObject.title, content: newsObject.content)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let newsObject = self.news![indexPath.row]
        let height = NewsCell.getHeightGivenContent(newsObject.content, width: self.view.frame.width - MARGIN * 2)
        
        return height
    }
}

