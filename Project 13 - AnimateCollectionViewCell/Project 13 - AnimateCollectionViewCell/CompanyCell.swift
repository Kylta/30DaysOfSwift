//
//  CompanyCell.swift
//  Project 13 - AnimateCollectionViewCell
//
//  Created by Christophe Bugnon on 10/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class CompanyCell: UICollectionViewCell {
    
    var company: CompanyModel? {
        didSet {
            nameCompany.text = company?.name
            descriptionCompanyText.text = company?.description
            companyImageView.image = company?.image
        }
    }
    
    let companyImageView: UIImageView = {
        let iv = UIImageView(image: UIImage())
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameCompany: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionCompanyText: UITextView = {
        let textView = UITextView()
        textView.text = "Here will be text for description"
        textView.textColor = .white
        textView.font = UIFont(name: "Helvetica", size: 16)
        textView.backgroundColor = .tealColor
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .tealColor
        setupUI()
    }
    
    func setupUI() {
        
        addSubview(companyImageView)
        [companyImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
         companyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         companyImageView.widthAnchor.constraint(equalToConstant: 84),
         companyImageView.heightAnchor.constraint(equalToConstant: 84)].forEach({$0.isActive = true})
        
        addSubview(nameCompany)
        [nameCompany.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
         nameCompany.leftAnchor.constraint(equalTo: companyImageView.rightAnchor, constant: 8),
         nameCompany.heightAnchor.constraint(equalToConstant: 20),
         nameCompany.rightAnchor.constraint(equalTo: self.rightAnchor)].forEach({$0.isActive = true})
        
        addSubview(descriptionCompanyText)
        [descriptionCompanyText.topAnchor.constraint(equalTo: nameCompany.bottomAnchor),
        descriptionCompanyText.leftAnchor.constraint(equalTo: companyImageView.rightAnchor, constant: 4),
        descriptionCompanyText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
        descriptionCompanyText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)].forEach({$0.isActive = true})
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
