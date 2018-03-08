//
//  ViewController.swift
//  Project 11 - ClearTableViewCell
//
//  Created by Christophe Bugnon on 08/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let tableData = ["Here is the first cell", "And here the second", "So i'm the third ?", "Yes and i'm behind you bro", "That's good cells 😃", "But i'm the sixth", "There is a good view ","I've nothing to say anymore...", "But this challenge is pretty good", "I think i'm the last cell", "Hummm... No bro, it's me !", "Trollers gonna troll 🤓"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .black
        
        navigationItem.title = "Degraded cells"
        
        setupNavBar()
        
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        
        let colorTitle = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 22)]
        
        navigationController?.navigationBar.titleTextAttributes = colorTitle
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        
        return UIColor(red: 0.2, green: color, blue: 0.8, alpha: 1.0)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath )
        
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        
        cell.textLabel?.text = tableData[indexPath.row]
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        cell.textLabel?.textColor = .white
        
        return cell
    }

}

