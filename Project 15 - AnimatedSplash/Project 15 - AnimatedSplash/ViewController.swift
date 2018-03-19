//
//  ViewController.swift
//  Project 15 - AnimatedSplash
//
//  Created by Christophe Bugnon on 15/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mask = CALayer()
    
    let homeScreenView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "homeScreen"))
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeScreenView.frame = view.bounds
        
        view.addSubview(homeScreenView)
        view.backgroundColor = .blue
        
        setupMask()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(splashAnimation), userInfo: nil, repeats: false)
        
    }
    
    @objc func splashAnimation() {
        let scale: CGFloat = 50
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            self.mask.bounds = CGRect(x: 0, y: 0, width: 100 * scale, height: 100 * scale)
        }, completion: nil)
    }
    
    func setupMask() {
        mask.contents = UIImage(named: "linkedIn")?.cgImage
        mask.contentsGravity = kCAGravityResizeAspect
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mask.position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        homeScreenView.layer.mask = mask
    }

}

