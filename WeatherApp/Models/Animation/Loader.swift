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
    
    var animationStep: cycles = .cycle2 {
        didSet {
            self.updateStep()
        }
    }
        let animationaDuration: TimeInterval = 1
        
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
        self.updateStep()
        }
        
        func stop() {
        self.isHidden  = true
        self.isLoading = false
        }
        
        func updateStep() {
        print("\(self.label)")
        
        if false == self.isLoading {
        return
        }
        
        switch self.animationStep {
        case .cycle1:
        self.animateStep1()
        case .cycle2:
        self.animateStep2()
        case .cycleEnd:
        self.animateStepEnd()
        }
        }
        
        func animateStep1() {
        UIView.animate(withDuration: self.animationaDuration,
        animations: {
        self.label?.frame.origin.x = self.frame.size.width / 3 * 2
        }) { (finished: Bool) in
        self.animationStep = .cycle2
        }
        }
        
        func animateStep2() {
        UIView.animate(withDuration: self.animationaDuration,
        animations: {
        self.label?.frame.origin.x = self.frame.size.width / 3
        }) { (finished: Bool) in
        self.animationStep = .cycleEnd
        }
        }
    
        func animateStepEnd() {
        UIView.animate(withDuration: self.animationaDuration,
        animations: {
        self.label?.frame.origin.x = 1
        }) { (finished: Bool) in
        self.animationStep = .cycle1
        }
        }
    }


