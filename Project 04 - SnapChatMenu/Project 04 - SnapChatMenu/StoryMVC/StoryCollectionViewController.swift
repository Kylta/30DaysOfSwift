//
//  StoryCollectionViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by Christophe Bugnon on 01/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class StoryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        navigationController?.navigationBar.barTintColor = .purple
        
        collectionView?.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .green
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var newSize = CGSize()
        newSize.width = 200
        
        let screenBounds = UIScreen.main.bounds
        let screenSize = screenBounds.size
        
        if (indexPath.item % 4 == 0 ||  indexPath.item % 4 == 3) {
            newSize.height = screenSize.height * 0.45
        } else {
            newSize.height = screenSize.height * 0.55
        }
        
        return newSize
       /* //cell.backgroundColor = (indexPath.item % 2 == 0) ? .purple : .yellow
        return (indexPath.item % 2 == 0) ? CGSize(width: 200, height: 200) : CGSize(width: 200, height: 250)*/
    }
    
}
