//
//  MainView.swift
//  WeatherApp
//
//  Created by Sergey on 04/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit



@IBDesignable class avatar: UIControl {

 
    @IBAction func likeButtonChanged() {
        print("likeButtonChanged")
    }
    
//    func addTarget(_ target: Any?,
//                   action: Selector,
//                   for controlEvents: UIControl.Event)
    

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

//
//enum likes: Int {
//    case like
//    case count
//
//
//static let likeVariants: [likes] = [like, count]
//
//var title: Any {
//    switch self {
//    case .like: return "l"
//    case .count: return 0
//    }
//}
//}
//
//
//@IBDesignable class Like: UIControl {
//    var likeStat:likes? = nil {
//        didSet {
//            self.updateLike()
//            self.sendActions(for: .valueChanged)
//        }
//    }
//    private var buttons: [UIButton] = []
//    private var stackView: UIStackView!
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setupView()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder:aDecoder)
//        self.setupView()
//    }
//
//    private func setupView() {
//        for pos in likes.likeVariants {
//            let button = UIButton(type: .custom)
//            button.setImage(UIImage(named: "dislike"), for: .normal)
//        button.setImage(UIImage(named: "like"), for: .selected)
//            button.addTarget(self, action: #selector(likeOrNot(_:)), for: .touchUpInside)
//
//
//            self.buttons.append(button)
//        }
//        stackView = UIStackView(arrangedSubviews: self.buttons)
//        self.addSubview(stackView)
////
//        stackView.spacing = 3
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillEqually
//
//    }
//    private func updateLike () {
//        for (index, button) in self.buttons.enumerated() {
//            guard let like = likes(rawValue: index) else { continue}
//            button.isSelected = like == self.likeStat
//        }
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        stackView.frame = bounds
//    }
//
//    @objc private func likeOrNot (_ sender: UIButton) {
//        guard let index = self.buttons.index(of: sender) else {return}
//        guard let like = likes(rawValue: index) else {return}
//        self.likeStat = like
//    }
//}
