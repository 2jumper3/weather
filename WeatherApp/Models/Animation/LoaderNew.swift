//
//  LoaderNew.swift
//  WeatherApp
//
//  Created by Sergey on 19/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class LoaderNew: UIView {
    
   private weak var shapeLayer: CAShapeLayer?
    
    
    public func animate() {
        self.addShapeLayer()
        self.shapeLayer?.path = self.loaderPath().cgPath
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.duration = 5
        
        self.shapeLayer?.add(pathAnimation, forKey: "pathAnimation")
        
        
    }
    
   private func addShapeLayer() {
        if nil != self.shapeLayer {
            return
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        
        self.shapeLayer = shapeLayer
    }
    
    private func loaderPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 40, y: 20))
        path.addLine(to: CGPoint(x: 45, y: 40))
        path.addLine(to: CGPoint(x: 65, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 70))
        path.addLine(to: CGPoint(x: 40, y: 55))
        path.addLine(to: CGPoint(x: 20, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 50))
        path.addLine(to: CGPoint(x: 15, y: 40))
        path.addLine(to: CGPoint(x: 35, y: 40))
        path.addLine(to: CGPoint(x: 40, y: 20))

        return path
    }
}
