//
//  ViewController.swift
//  Project 12 - LoginAnimation
//
//  Created by Christophe Bugnon on 09/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let logo: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "supreme"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 220/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        setupLayout()
        
    }
    
    @objc private func handleLogin() {
        
        let loginController = LoginController()
        
        present(loginController, animated: true, completion: nil)
        
    }
    
    private func setupLayout() {
        view.addSubview(logo)
        [logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
         logo.widthAnchor.constraint(equalToConstant: 300),
         logo.heightAnchor.constraint(equalToConstant: 100),
         logo.centerXAnchor.constraint(equalTo: view.centerXAnchor)].forEach({$0.isActive = true})
        
        view.addSubview(loginButton)
        [loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
         loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
         loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
         loginButton.heightAnchor.constraint(equalToConstant: 80)].forEach({$0.isActive = true})
        
        view.addSubview(signUpButton)
        [signUpButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
         signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
         signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
         signUpButton.heightAnchor.constraint(equalToConstant: 80)].forEach({$0.isActive = true})
        
    }

}

