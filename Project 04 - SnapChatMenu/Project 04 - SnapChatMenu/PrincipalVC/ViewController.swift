//
//  ViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by Christophe Bugnon on 01/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        sv.backgroundColor = .white
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
        
        let contactTVC = UINavigationController(rootViewController: ContactTableViewController())
        
        let cameraVC = UINavigationController(rootViewController: CameraViewController())
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
       // layout.minimumInteritemSpacing = 0
        
        let storyVC = UINavigationController(rootViewController: StoryCollectionViewController(collectionViewLayout: layout))
        
        
        // Contact VIEW
        self.addChildViewController(contactTVC)
        self.scrollView.addSubview(contactTVC.view)
        contactTVC.didMove(toParentViewController: self)
        
        // CAMERA VIEW
        self.addChildViewController(cameraVC)
        self.scrollView.addSubview(cameraVC.view)
        cameraVC.didMove(toParentViewController: self)
        
        var cameraVCFrame : CGRect = cameraVC.view.frame
        cameraVCFrame.origin.x = self.view.frame.width
        cameraVC.view.frame = cameraVCFrame
        
        // Story VIEW
        self.addChildViewController(storyVC)
        self.scrollView.addSubview(storyVC.view)
        storyVC.didMove(toParentViewController: self)
        
        var storyVCFrame : CGRect = storyVC.view.frame
        storyVCFrame.origin.x = 2 * self.view.frame.width
        storyVC.view.frame = storyVCFrame
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.size.height)
        
       // view.backgroundColor = .lightGray
        
    }

}

