//
//  ViewController.swift
//  Project 05 - CarouselEffect
//
//  Created by Christophe Bugnon on 02/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let backgroundView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "patrick-tomasso-216284-unsplash"))
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let data = [
        Image(name: "Book with leaf 🍁", picture: #imageLiteral(resourceName: "book")),
        Image(name: "Dude in the desert", picture: #imageLiteral(resourceName: "desert")),
        Image(name: "Morning coffee ☕️", picture: #imageLiteral(resourceName: "Coffee")),
        Image(name: "Computer 💻", picture: #imageLiteral(resourceName: "computer")),
        Image(name: "Moutains 🗻", picture: #imageLiteral(resourceName: "Mountains")),
        Image(name: "Gourmet coffee 🍫", picture: #imageLiteral(resourceName: "chill"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundView = backgroundView
        
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView?.register(ImageCell.self, forCellWithReuseIdentifier: "cellId")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ImageCell
        
        cell.layer.cornerRadius = 20
        
        let image = data[indexPath.row]
        cell.image = image
        
        return cell
    }

}

