//
//  MyGroupsTableViewController.swift
//  WeatherApp
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var groups = [Group] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assignbackground()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableViewCell", for: indexPath) as! MyGroupsTableViewCell
        let group = self.groups[indexPath.row]
        

        cell.setGroup(group: group)
        
        // Configure the cell...
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGroup", let dest = segue.destination as? AllGroupsTableViewController {
            dest.delegate = self
        } else if segue.identifier == "openGroup", let dest = segue.destination as? MyGroupsTableViewController {
            dest.groups = [self.groups[self.tableView.indexPathForSelectedRow!.row]]
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    
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
    }
}
extension MyGroupsTableViewController: AddGroupDeligate {
    func addGroup(group: Group) {
        var contains = false
        for groupInVC in self.groups {
            if group.name == groupInVC.name {
                contains = true
                break
            }
        }
        if false == contains {
            self.groups.append(group)
            self.tableView.reloadData()
        }
    }
}

