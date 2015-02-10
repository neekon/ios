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
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
