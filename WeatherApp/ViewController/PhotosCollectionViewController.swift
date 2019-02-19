//
//  PhotosCollectionViewController.swift
//  WeatherApp
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    //Анимация фотографии
    
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
    }
    
//    Анимация
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? PhotosCollectionViewCell {
                UIView.animate(withDuration: 1,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 0,
                               options: [],
                               animations: {
                                var screenSize = UIScreen.main.bounds.size
                                let height = CGFloat(self.view.frame.size.height)
                                let width  = CGFloat(self.view.frame.size.width)
//                                cell.photo?.frame = CGRect(x: 0, y: 0, width: width, height: height)
                                cell.photo?.bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
                                
                                
//                                cell.photo?.transform = .init(scaleX: 1.50, y: 1.50)
//                                cell.photo?.transform = .init(scaleX: 1, y: 1)
//                                cell.frame.origin.y += 10

                })
//                cell.photo?.transform = .init(scaleX: 0.50, y: 0.50)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = UIScreen.main.bounds.size
        
        return cellSize
        //        let viewControllerSize = self.view.frame.size
        //        return viewControllerSize
    }
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? PhotosCollectionViewCell {
//                cell.photo?.transform = .identity
                
                cell.contentView.backgroundColor = .clear
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
            cell.photo?.image = UIImage(named: "image1")
        
        
        // Configure the cell
    
        return cell
    }
  
}
