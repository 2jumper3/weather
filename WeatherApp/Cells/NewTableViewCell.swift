//
//  NewTableViewCell.swift
//  WeatherApp
//
//  Created by Sergey on 12/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsCell: UILabel?
    @IBOutlet weak var newsImage: UIImageView?
    @IBOutlet weak var likeButton: LikeButton?
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(group: String, emblem: UIImage) {
        self.newsCell?.text = group
        self.newsImage?.image = emblem
    }
    override func prepareForReuse() {
        super.prepareForReuse()
//        self.newsImage?.image = nil
//        self.newsCell?.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.newsImage?.clipsToBounds = true
        self.newsImage?.layer.cornerRadius = (self.newsImage?.frame.width)! / 2
    }
    
}
