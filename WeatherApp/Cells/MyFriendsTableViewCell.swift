//
//  MyFriendsTableViewCell.swift
//  WeatherApp
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class MyFriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendName: UILabel?
    func setFriend(friend: Friend) {
        self.friendName?.text = friend.name
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
