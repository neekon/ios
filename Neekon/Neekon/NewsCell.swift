//
//  NewsCell.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/27/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit

private let IMAGE_HEIGHT = CGFloat(220.0)

class NewsCell: UITableViewCell {
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let mainImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
        titleLabel.text = ""
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        
        mainImageView.image = UIImage()
        mainImageView.contentMode = UIViewContentMode.Redraw
        
        contentLabel.text = ""
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        
        addSubview(titleLabel)
        addSubview(mainImageView)
        addSubview(contentLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()

        titleLabel.snp_makeConstraints { make in
            make.top.equalTo(self.snp_top).with.offset(MARGIN)
            make.left.equalTo(self.snp_left).width.offset(MARGIN)
            make.right.equalTo(self.snp_right).with.offset(-MARGIN)
            make.height.equalTo(35)
            return
        }

        let sizeThatFits = contentLabel.sizeThatFits(CGSize(width: frame.size.width - MARGIN * 2, height: CGFloat(FLT_MAX)))
        contentLabel.snp_makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp_bottom).with.offset(MARGIN)
            make.left.equalTo(self.snp_left).with.offset(MARGIN)
            make.right.equalTo(self.snp_right).with.offset(-MARGIN)
            make.height.equalTo(sizeThatFits.height)
            return
        }

        mainImageView.snp_makeConstraints { make in
            make.top.equalTo(self.contentLabel.snp_bottom).with.offset(MARGIN)
            make.left.equalTo(self.snp_left).with.offset(MARGIN)
            make.right.equalTo(self.snp_right).with.offset(-MARGIN)
            make.height.equalTo(IMAGE_HEIGHT)
            return
        }
    }
    
    class func getHeightGivenContent(content: String?, imageUrl: String?, width: CGFloat) -> CGFloat {
        var height = MARGIN + 35.0 + MARGIN
        
        let contentLabel = UILabel()
        contentLabel.text = content
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont(name: "HelveticaNeue", size: 14)

        let sizeThatFits = contentLabel.sizeThatFits(CGSize(width: width, height: CGFloat(FLT_MAX)))
        
        height += sizeThatFits.height + MARGIN

        // image
        if imageUrl != nil {
            height += IMAGE_HEIGHT + MARGIN * 2
        }

        return height
    }
    
    func fill(title: NSString?, content: NSString?, imageUrl: NSString?) {

        titleLabel.text = title
        contentLabel.text = content
        if imageUrl != nil {
            if let url = NSURL(string: imageUrl!) {
                if let data = NSData(contentsOfURL: url) {
                    if let image = UIImage(data: data) {
                        mainImageView.image = image
                    }
                }
            }
        }

        updateConstraints()
    }
}
