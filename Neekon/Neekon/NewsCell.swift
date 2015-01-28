//
//  NewsCell.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/27/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    let titleLabel = UILabel()
    let contentLabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.text = ""
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        
        contentLabel.text = ""
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        contentLabel.adjustsFontSizeToFitWidth = true
        
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        let margin : CGFloat = 5.0
        titleLabel.frame = CGRectMake(margin, margin, self.frame.size.width - margin * 2, 35)
        contentLabel.sizeToFit()
        contentLabel.frame = CGRectMake(margin, titleLabel.frame.size.height + margin * 2, self.frame.size.width - margin * 2, 200)
    }
    
}
