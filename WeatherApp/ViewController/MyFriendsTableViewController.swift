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
    var separators: [String] = []
    var friendsSeparators: [String: [Friend]] = [:]
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
        
        self.tableView.tableFooterView = UIView()

        
        assignbackground()
        addFriends()
        fillSections()
        reloadCities()
       
    }
    
    func addFriends() {
    let allFriends = ["Елизавета", "Петр", "Иван", "Федор", "Сергей", "Николай", "Борис", "Иоан"]
    for name in allFriends {
    let friend = Friend()
    friend.name = name
    
    self.friends.append(friend)
    }
    self.filter(query: "")
}
    
    func fillSections() {
        self.separators.removeAll()
        
        let aScalars = "А".unicodeScalars
        let aCode = aScalars[aScalars.startIndex].value
        
        if let unicode = UnicodeScalar(aCode) {
            let letter = Character(unicode)
            self.separators.append(String(letter))
        }
        
        for _ in 0..<31 {
            guard let lastSymbol = self.separators.last else {
                continue
            }
            let lastUnicode = lastSymbol.unicodeScalars
            let code = lastUnicode[lastUnicode.startIndex].value
            
            guard let unicode = UnicodeScalar(code + 1) else {
                continue
            }
            
            let letter = Character(unicode)
            self.separators.append(String(letter))
        }
    }
    
    
    func reloadCities() {
        
        self.friendsSeparators.removeAll()
        
        for friend in self.friends {
            guard let firstLetter = friend.name?.first else {
                continue
            }
            
            var friends: [Friend] = []
            
            if let friendsSeparators = self.friendsSeparators[String(firstLetter)] {
                friends.append(contentsOf: friendsSeparators)
            }
            
            friends.append(friend)
            
            self.friendsSeparators[String(firstLetter)] = friends
        }
        
        self.tableView.reloadData()
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
//внешний вид футера
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var label = UILabel()
//        label = UIImage(named: "<#T##String#>")
        label.text = self.separators[section]
        label.textAlignment = .left
        label.backgroundColor = UIColor.darkGray
        label.textColor = UIColor.white
        
        return label
        
    }
    
    // Разделение на секции
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.separators.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionName: String = self.separators[section]
        if let friendsSeparators: [Friend] = self.friendsSeparators[sectionName], friendsSeparators.count > 0 {
            return 30
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName: String = self.separators[section]
        if let friendsSeparators: [Friend] = self.friendsSeparators[sectionName] {
            return friendsSeparators.count
        }
        return 0
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //ячейка от таблицы
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell", for: indexPath) as! MyFriendsTableViewCell
//        сам город
        let friend = self.friendsFilter[indexPath.row]
        cell.setFriend(friend: friend)
        
        let sectionName: String = self.separators[indexPath.section]
        if let friendsSeparators: [Friend] = self.friendsSeparators[sectionName] {
            let friend = friendsSeparators[indexPath.row]
            cell.setFriend(friend: friend)
        }
        
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
