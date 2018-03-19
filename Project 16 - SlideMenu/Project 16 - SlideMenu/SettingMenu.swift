//
//  SettingMenu.swift
//  Project 16 - SlideMenu
//
//  Created by Christophe Bugnon on 19/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class SettingMenu: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let data = [
        MenuData(name: "Setting", icon: #imageLiteral(resourceName: "setting").withRenderingMode(.alwaysTemplate)),
        MenuData(name: "Account", icon: #imageLiteral(resourceName: "account").withRenderingMode(.alwaysTemplate)),
        MenuData(name: "Help", icon: #imageLiteral(resourceName: "Question").withRenderingMode(.alwaysTemplate))
    ]
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 70/255, green: 78/255, blue: 105/255, alpha: 1)
        return cv
    }()
    
    func showSettings(view: UIView) {
        //show menu
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        view.addSubview(blackView)
        view.addSubview(collectionView)
        blackView.frame = view.frame
        blackView.alpha = 0
        
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))

        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: 150)
        }, completion: nil)
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.blackView.alpha = 0
            self.collectionView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SettingCell
        
        cell.tintColor = .white
        
        let dataMenu = data[indexPath.item]
        
        cell.setting = dataMenu
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

        
    override init() {
        super.init()
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
        
}
