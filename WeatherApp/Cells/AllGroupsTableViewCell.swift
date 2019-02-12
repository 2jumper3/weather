//
//  AllGroupsTableViewCell.swift
//  WeatherApp
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel?
    @IBOutlet weak var images: UIImageView?
    
    func setGroup(group: Group) {
        self.groupName?.text = group.name
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
