//
//  TweetTableViewCell.swift
//  LocalHackDay2018
//
//  Created by Jarvis Wu on 2018-12-01.
//  Copyright © 2018 Jarvis Wu. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowOpacity = 0.4
            containerView.layer.shadowRadius = 3
            containerView.layer.shadowColor = UIColor.lightGray.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
    }
    
}
