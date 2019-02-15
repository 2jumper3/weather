//
//  NewsTableViewController.swift
//  WeatherApp
//
//  Created by Sergey on 07/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news = ["Favorites", "Moscow News", "In Your Region", "In Country", "In World"]

    var newsArray = [
        (title: "Favorites", emblem: UIImage(named: "image1")),
        (title: "Moscow News", emblem: UIImage(named: "image2")),
        (title: "In Your Region", emblem: UIImage(named: "image3")),
        (title: "In Country", emblem: UIImage(named: "image4")),
        (title: "In World", emblem: UIImage(named: "image5")),]

    override func viewDidLoad() {
        super.viewDidLoad()
//        assignbackground()
        let xib = UINib(nibName: "NewTableViewCell", bundle: Bundle.main)
        tableView?.register(xib, forCellReuseIdentifier: "NewTableViewCell")

    }
//    func assignbackground(){
//        let background = UIImage(named: "wallaper")
//
//        var imageView : UIImageView!
//        imageView = UIImageView(frame: view.bounds)
//        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = background
//        imageView.center = view.center
//        view.addSubview(imageView)
//        self.view.sendSubviewToBack(imageView)
    
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return news.count
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as! NewTableViewCell
        let new =  self.newsArray[indexPath.row]
        cell.configure(group: new.title, emblem: new.emblem!)
        // Configure the cell...
        
        return cell
    }

}



