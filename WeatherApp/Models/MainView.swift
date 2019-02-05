//
//  MainView.swift
//  WeatherApp
//
//  Created by Sergey on 04/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit



@IBDesignable class MainView: UIView {
    
    
    @objc func likeTap() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = UIColor.darkGray.cgColor
       
        // отработка нажатий
        
        let tap = UIGestureRecognizer(target: self, action: #selector(likeTap))
        self.addGestureRecognizer(tap)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(likeTap))
        self.addGestureRecognizer(longPress)
        
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 25
//        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.9
        self.layer.shadowRadius = 20
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        

        
//        let maskLayer  = CAShapeLayer()
//        let path = self.starPath
        
// Градиенты
        
//        let gradienLayer = CAGradientLayer()
//        gradienLayer.colors = [UIColor.white.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor]
//        gradienLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradienLayer.endPoint = CGPoint(x: 0.5, y: 1)
//        self.layer.addSublayer(gradienLayer)
//        gradienLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        gradienLayer.cornerRadius = 25
        
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 44, height: 45))
     
    }
 
// поведение контрола
//    override func beginTracking (_ touch: UITouch, with event: UIEvent?) -> Bool {
//        super.beginTracking(touch, with: event)
//        return true
//    }
//    override func continueTracking (_ touch: UITouch, with event: UIEvent?) -> Bool {
//        super.beginTracking(touch, with: event)
//        return true
//    }
//    override func endTracking (_ touch: UITouch?, with event: UIEvent?) {
//        super.endTracking (touch, with: event)
//    }
//    override func cancelTracking (with event: UIEvent?) {
//        super.canselTracking (with: event)
//    }
}

enum likes: Int {
    case like
    case count


static let likeVariants: [likes] = [like, count]

var title: Any {
    switch self {
    case .like: return "l"
    case .count: return 0
    }
}
}


@IBDesignable class Like: UIControl {
    var likeStat:likes? = nil {
        didSet {
            self.updateLike()
            self.sendActions(for: .valueChanged)
        }
    }
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.setupView()
    }

    private func setupView() {
        for pos in likes.likeVariants {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "dislike"), for: .normal)
        button.setImage(UIImage(named: "like"), for: .selected)

//            if button.allControlEvents == UIControl.Event.touchUpInside {
//                if button.isSelected == true {
//                    button.setImage(UIImage(named: "dislike"), for: .selected)
//                } else {
//                    button.setImage(UIImage(named: "like"), for: .selected)
//                }
//            button.setImage(UIImage(named: "dislike"), for: .selected)
//        }  else {
//            button.setImage(UIImage(named: "like"), for: .selected)
        
            button.addTarget(self, action: #selector(likeOrNot(_:)), for: .touchUpInside)
        

            self.buttons.append(button)
        }
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
//
        stackView.spacing = 3
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually

    }
    private func updateLike () {
        for (index, button) in self.buttons.enumerated() {
            guard let like = likes(rawValue: index) else { continue}
            button.isSelected = like == self.likeStat
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }

    @objc private func likeOrNot (_ sender: UIButton) {
        guard let index = self.buttons.index(of: sender) else {return}
        guard let like = likes(rawValue: index) else {return}
        self.likeStat = like
    }
}
