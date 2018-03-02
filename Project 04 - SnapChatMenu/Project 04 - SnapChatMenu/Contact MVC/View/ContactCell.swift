//
//  ContactCell.swift
//  Project 04 - SnapChatMenu
//
//  Created by Christophe Bugnon on 01/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    let pictureContact: UIView = {
        let pc = UIView()
        pc.backgroundColor = .blue
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name contact"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusPicture: UIView = {
        let sp = UIView()
        sp.backgroundColor = .red
        sp.translatesAutoresizingMaskIntoConstraints = false
        return sp
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivered 21m ago"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .green
        
        addSubview(pictureContact)
        pictureContact.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        pictureContact.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pictureContact.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        pictureContact.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        pictureContact.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: pictureContact.rightAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        nameLabel.heightAnchor.constraint(equalToConstant: 20)
        
        addSubview(statusPicture)
        statusPicture.leftAnchor.constraint(equalTo: pictureContact.rightAnchor, constant: 8).isActive = true
        statusPicture.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        statusPicture.widthAnchor.constraint(equalToConstant: 15).isActive = true
        statusPicture.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        addSubview(statusLabel)
        statusLabel.leftAnchor.constraint(equalTo: statusPicture.rightAnchor, constant: 4).isActive = true
        statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
