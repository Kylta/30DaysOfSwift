//
//  VideoCell.swift
//  Project 03 - Play Local Video
//
//  Created by Christophe Bugnon on 28/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    var video: VideoModel? {
        didSet {
            imageView.image = UIImage(named: (video?.image)!)
            titleLabel.text = video?.title
            sourceLabel.text = video?.source
            
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private  let playImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "playBtn")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private  let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private  let sourceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageView.addSubview(playImage)
        playImage.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        playImage.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        playImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        playImage.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        imageView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        
        imageView.addSubview(sourceLabel)
        sourceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        sourceLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
        sourceLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        sourceLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        sourceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
