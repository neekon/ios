//
//  MainNavigationController.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 2/9/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImage = UIImage(named:"home-BG.jpg")
        let bgImageView = UIImageView(image: bgImage)
        bgImageView.frame = self.view.frame
        self.view.addSubview(bgImageView)
        self.view.sendSubviewToBack(bgImageView)
        self.view.backgroundColor = UIColor.clearColor()
        
        self.navigationBar.translucent = true
        self.navigationBar.barTintColor = UIColor.purpleColor()
        
        UITabBar.appearance().barTintColor = UIColor.purpleColor()
        UITabBar.appearance().tintColor = UIColor.whiteColor()
//        
//        let tabBarItems = self.tabBarController?.tabBar.items as [UITabBarItem]
//        
//        let newsTab = tabBarItems[0]
//        
//        let newsTabImage = UIImage(named: "home-icon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
//        newsTab.image = newsTabImage
//        newsTab.selectedImage = UIImage(named: "home-icon-selected")
//        
    
//        UITabBarItem *tabBarItem = [self.tabBarController!.tabBar.items objectAtIndex:0];
//        
//        UIImage *unselectedImage = [UIImage imageNamed:@"icon-unselected"];
//        UIImage *selectedImage = [UIImage imageNamed:@"icon-selected"];
//        
//        [tabBarItem setImage: [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [tabBarItem setSelectedImage: selectedImage];
        
        
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
