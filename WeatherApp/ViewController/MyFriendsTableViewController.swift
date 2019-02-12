//
//  MyFriendsTableViewController.swift
//  WeatherApp
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {
    
    private var friends: [Friend]  = []
    var friendsFilter: [Friend] = []
//    "Anna","Petr", "Ivan", "Fedor", "Sergey", "Nikola", "Boris"

    func assignbackground(){
                let background = UIImage(named: "wallaper")
        
                var imageView : UIImageView!
                imageView = UIImageView(frame: view.bounds)
                imageView.contentMode =  UIView.ContentMode.scaleAspectFill
                imageView.clipsToBounds = true
                imageView.image = background
                imageView.center = view.center
                view.addSubview(imageView)
                self.view.sendSubviewToBack(imageView)
                self.tableView.backgroundView = imageView

            }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        
        let allFriends = ["Anna","Petr", "Ivan", "Fedor", "Sergey", "Nikola", "Boris"]
        for name in allFriends {
            let friend = Friend()
            friend.name = name
            
            self.friends.append(friend)
        }
    
        
        self.filter(query: "")
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsFilter.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell", for: indexPath) as! MyFriendsTableViewCell
        
        let friend = self.friendsFilter[indexPath.row]
        cell.setFriend(friend: friend)
        
        return cell
    } 
    }

extension MyFriendsTableViewController {
    func filter(query: String) {
        self.friendsFilter.removeAll()
        
        for one in self.friends {
            
            guard let name = one.name else {
                continue
            }
            
            var isInFilter = true
            
            if query.count > 0 {
                isInFilter = name.lowercased().contains(query.lowercased())
            }
            
            if isInFilter {
                self.friendsFilter.append(one)
            }
        }
        
        self.tableView.reloadData()
    }
}


extension MyFriendsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(query: searchText)
    }
}
