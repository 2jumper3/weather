//
//  MainView.swift
//  WeatherApp
//
//  Created by Sergey on 04/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit



@IBDesignable class avatar: UIControl {
    
    
    @objc func tapAction () {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tap)
    }
    
    

    private weak var avaView: UIImageView?
    
    @IBInspectable var avaName: String = "ava" {
        didSet {
            self.addSubviews()
            self.setNeedsLayout()
            self.layoutIfNeeded()
            self.avaView?.image = UIImage(named: avaName)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            self.setShadow()
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAppearance()
        self.addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setAppearance()
        self.addSubviews()
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.avaView?.frame = self.bounds
        self.avaView?.layer.cornerRadius = self.frame.size.height / 2
        self.avaView?.layer.masksToBounds = true
        
        
    }
    
    // MARK: - Appearance
    
    private func setAppearance() {
        self.backgroundColor = nil
        
        self.setShadow()
    }
    
    private func setShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOffset = CGSize(width: 0, height: self.shadowRadius)
    }
    
    // MARK: - Subviews
    
    private func addSubviews() {
        if nil == self.avaView {
            let avaView = UIImageView(image: UIImage(named: "ava"))
            self.addSubview(avaView)
            self.avaView = avaView

        }
    }
}
