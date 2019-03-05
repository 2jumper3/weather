//
//  Loader.swift
//  WeatherApp
//
//  Created by Sergey on 15/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

enum cycles {
    case cycle1
    case cycle2
    case cycleEnd
}

class Loader: UIView {
    
    weak var label: UILabel?
    
        let animationaDuration: TimeInterval = 1
        let delay: TimeInterval = 0.5
    
        private var isLoading: Bool = false
        
        
        override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
        }
        
        func customInit() {
        let label = UILabel()
        label.text = "•"
        label.frame = self.bounds
        
        self.addSubview(label)
        self.label = label
        }
        
        override func layoutSubviews() {
        super.layoutSubviews()
        self.label?.frame = self.bounds
        }
        
        
        func start() {
        self.isHidden  = false
        self.isLoading = true
        self.fullAnimation()
        }
        
        func stop() {
        self.isHidden  = true
        self.isLoading = false
        }

    
    func fullAnimation() {
        UIView.animateKeyframes(withDuration: 3, delay: 0,
                                options: [.repeat],
                                animations: {
        self.addAnimation()
                                   
        }) { (finished: Bool) in
            
        }

    }
    
    func addAnimation () {
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33, animations: {
                            self.label?.frame.origin.x = self.frame.size.width / 3
                            self.label?.alpha = 1
            
        })
        UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.66, animations: {
                            self.label?.frame.origin.x = self.frame.size.width / 3 * 2
                            self.label?.alpha = 1
//                            self.label?.alpha = 0
        })
        UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33, animations: {
                            self.label?.frame.origin.x = self.frame.size.width / 1
                            self.label?.alpha = 0
        })
        
    }
 }
