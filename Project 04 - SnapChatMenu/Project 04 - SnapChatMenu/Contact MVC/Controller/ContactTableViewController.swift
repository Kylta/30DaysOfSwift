//
//  CameraViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by Christophe Bugnon on 01/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 96/255, green: 80/255, blue: 248/255, alpha: 1)
        
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + 50)
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: "cellId")
        
        tableView.tableFooterView = UIView()
        
        setupNavBarButton()
        
    }
    
    func setupNavBarButton() {
        
        let friendsBarButton = UIBarButtonItem(title: "Friends", style: .plain, target: self, action: #selector(handleText))
        friendsBarButton.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 24)!], for: .normal)
        friendsBarButton.tintColor = .white
        
        let glassBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-search").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleGlass))
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: #imageLiteral(resourceName: "baby").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBitmoji)), glassBarButton, friendsBarButton]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "chat").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleChat))
        
    }
    
    @objc func handleChat() {
        print("Chat pressed")
    }
    
    @objc func handleGlass() {
        print("Glass Pressed")
    }
    
    @objc func handleText() {
        print("Text pressed")
    }
    
    @objc func handleBitmoji() {
        print("Bitmoji Pressed")
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ContactCell
        
        //cell.backgroundColor = .green
        
        return cell
    }
}

extension UIBarButtonItem {
    
    
    
}
