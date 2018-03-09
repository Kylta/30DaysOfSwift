//
//  LoginController.swift
//  Project 12 - LoginAnimation
//
//  Created by Christophe Bugnon on 09/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usernameView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.font = UIFont.boldSystemFont(ofSize: 22)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.boldSystemFont(ofSize: 22)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.backgroundColor = UIColor(red: 220/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        setupLayout()
        animationPresentation()
    }
    
    @objc private func handleLoginButton() {

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 20, options: .autoreverse, animations: {
            self.loginButton.transform = .init(scaleX: 1.25, y: 1.25)
        }, completion: { (true) in
            self.loginButton.transform = .identity
        })
    }
    
    private func animationPresentation() {
        self.usernameView.transform = .init(translationX: -self.view.bounds.width, y: 0)
        self.usernameTextField.transform = .init(translationX: -self.view.bounds.width, y: 0)
        
        self.passwordView.transform = .init(translationX: -self.view.bounds.width, y: 0)
        self.passwordTextField.transform = .init(translationX: -self.view.bounds.width, y: 0)
        
        self.loginButton.transform = .init(translationX: -self.view.bounds.width, y: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.usernameView.transform = .identity
            self.usernameTextField.transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.10, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.passwordView.transform = .identity
            self.passwordTextField.transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.20, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.loginButton.transform = .identity
        }, completion: nil)
        
    }
    
    
    private func setupLayout() {
        
        view.addSubview(label)
        [label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
         label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         label.heightAnchor.constraint(equalToConstant: 50),
         label.widthAnchor.constraint(equalToConstant: 200),].forEach({$0.isActive = true})
        
        view.addSubview(usernameView)
        [usernameView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
         usernameView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
         usernameView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
         usernameView.heightAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
        
        view.addSubview(usernameTextField)
        [usernameTextField.topAnchor.constraint(equalTo: usernameView.topAnchor),
         usernameTextField.leftAnchor.constraint(equalTo: usernameView.leftAnchor, constant: 8),
         usernameTextField.bottomAnchor.constraint(equalTo: usernameView.bottomAnchor),
         usernameTextField.rightAnchor.constraint(equalTo: usernameView.rightAnchor)].forEach({$0.isActive = true})

        view.addSubview(passwordView)
        [passwordView.topAnchor.constraint(equalTo: usernameView.bottomAnchor, constant: 20),
         passwordView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
         passwordView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
         passwordView.heightAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
        
        view.addSubview(passwordTextField)
        [passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor),
         passwordTextField.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 8),
         passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),
         passwordTextField.rightAnchor.constraint(equalTo: passwordView.rightAnchor)].forEach({$0.isActive = true})
        
        view.addSubview(loginButton)
        [loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 50),
         loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         loginButton.widthAnchor.constraint(equalToConstant: 200),
         loginButton.heightAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
        
    }
    
    
    
}
