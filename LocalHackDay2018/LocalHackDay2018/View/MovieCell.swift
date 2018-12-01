//
//  MovieCell.swift
//  LocalHackDay2018
//
//  Created by Ziad Hamdieh on 2018-12-01.
//  Copyright © 2018 Jarvis Wu. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var movieSplash: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
