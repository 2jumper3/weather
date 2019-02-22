////
////  wallaper.swift
////  WeatherApp
////
////  Created by Sergey on 06/02/2019.
////  Copyright © 2019 Sergey. All rights reserved.
////
//
//import UIKit
//
//@IBDesignable class wallaper: UIView {
//    
//    private weak var wallaperView: UIImageView?
//    
//    @IBInspectable var wallaperName: String = "wallaper"{
//        didSet {
//            self.addSubviews()
//            self.setNeedsLayout()
//            self.layoutIfNeeded()
//            self.wallaperView?.image = UIImage(named: wallaperName)
//        }
//    }
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        self.setAppearance()
//        self.addSubviews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setAppearance()
//        self.addSubviews()
//    }
//    
//    private func setAppearance() {
//        self.backgroundColor = nil
//        
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        self.wallaperView?.frame = self.bounds
////        self.wallaperView?.layer.cornerRadius = self.frame.size.height / 2
//        self.wallaperView?.layer.masksToBounds = true
//        
//        
//    }
//    
//    private func addSubviews(){
//        if nil == self.wallaperView {
//            let wallaperView = UIImageView(image: UIImage(named: "wallaper"))
//            self.addSubview(wallaperView)
//            self.wallaperView = wallaperView
//        }
//    }
//}
