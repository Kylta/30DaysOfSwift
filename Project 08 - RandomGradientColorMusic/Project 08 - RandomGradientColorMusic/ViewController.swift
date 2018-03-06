//
//  ViewController.swift
//  Project 08 - RandomGradientColorMusic
//
//  Created by Christophe Bugnon on 06/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gradiantLayer = CAGradientLayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
        
    }
    
    @objc func changeColor() {
        let firstRandom = CGFloat(Int(arc4random_uniform(256)))
        let secondRandom = CGFloat(Int(arc4random_uniform(256)))
        let thirdRandom = CGFloat(Int(arc4random_uniform(256)))
        
        gradiantLayer.frame = view.frame
        gradiantLayer.colors = [
            UIColor.cgColor(red: firstRandom, green: secondRandom, blue: thirdRandom),
            UIColor.cgColor(red: secondRandom, green: firstRandom, blue: thirdRandom),
            UIColor.cgColor(red: thirdRandom, green: secondRandom, blue: firstRandom),
        ]
        gradiantLayer.startPoint = CGPoint(x: 0, y: 0)
        gradiantLayer.endPoint = CGPoint(x: 1, y: 1)
        animationGradient(gradiantLayer)
        view.layer.addSublayer(gradiantLayer)
        
    }
    
    func animationGradient(_ gradientLayer: CAGradientLayer) {
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 2
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.isRemovedOnCompletion = false
        
        gradiantLayer.add(gradientAnimation, forKey: "colorsChange")
    }
    
}

extension UIColor {
    static func cgColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).cgColor
    }
    
}
