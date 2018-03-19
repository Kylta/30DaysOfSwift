//
//  ArtistCell.swift
//  Project 16 - SlideMenu
//
//  Created by Christophe Bugnon on 15/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ArtistCell: UITableViewCell {
    
    var modelSong: ModelSong? {
        didSet {
            artistImage.image = modelSong?.imageSong
            iconArtist.image = modelSong?.iconArtist
            nameArtist.text = modelSong?.name
            nameSong.text = modelSong?.title
        }
    }
    
    let artistImage: UIImageView = {
        let iv = UIImageView(image: UIImage())
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let iconArtist: UIImageView = {
        let iv = UIImageView(image: UIImage())
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 37.5
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameArtist: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.text = "Artist name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameSong: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .lightGray
        label.text = "Artist name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        
        iconArtist.image = #imageLiteral(resourceName: "Wretch 32")
    }
    
    private func setupUI() {
        
        addSubview(artistImage)
        artistImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        artistImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        artistImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        artistImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(iconArtist)
        iconArtist.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        iconArtist.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        iconArtist.widthAnchor.constraint(equalToConstant: 75).isActive = true
        iconArtist.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        addSubview(nameArtist)
        nameArtist.leftAnchor.constraint(equalTo: iconArtist.rightAnchor, constant: 8).isActive = true
        nameArtist.topAnchor.constraint(equalTo: iconArtist.topAnchor, constant: 16).isActive = true
        nameArtist.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameArtist.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        addSubview(nameSong)
        nameSong.leftAnchor.constraint(equalTo: iconArtist.rightAnchor, constant: 8).isActive = true
        nameSong.topAnchor.constraint(equalTo: nameArtist.bottomAnchor, constant: 4).isActive = true
        nameSong.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameSong.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
