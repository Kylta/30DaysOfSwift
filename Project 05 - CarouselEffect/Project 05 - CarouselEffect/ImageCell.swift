//
//  ImageCell.swift
//  Project 05 - CarouselEffect
//
//  Created by Christophe Bugnon on 02/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    var image: Image? {
        didSet {
            namePicture.text = image?.name
            pictureView.image = image?.picture
        }
    }
    
    let namePicture: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pictureView: UIImageView = {
        let iv = UIImageView(image: UIImage())
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(namePicture)
        namePicture.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        namePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        namePicture.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        namePicture.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(pictureView)
        pictureView.bottomAnchor.constraint(equalTo: namePicture.topAnchor).isActive = true
        pictureView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pictureView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pictureView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
