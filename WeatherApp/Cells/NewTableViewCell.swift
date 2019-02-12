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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
