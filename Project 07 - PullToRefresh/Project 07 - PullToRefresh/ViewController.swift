//
//  ViewController.swift
//  Project 07 - PullToRefresh
//
//  Created by Christophe Bugnon on 04/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

struct NameList {
    let name: String
    
    static func getList() -> [NameList] {
        
        return [
            NameList(name: "OpenClassrooms"),
            NameList(name: "LetsBuildThatApp"),
            NameList(name: "BobTheDevelopper"),
            NameList(name: "Medium"),
            NameList(name: "Appcoda"),
        ]
    }
    
    static func newList(list: [NameList]) -> [NameList] {
        
        var array = list
        let newData = [
            NameList(name: "HackingWithSwift"),
            NameList(name: "Youtube"),
            NameList(name: "StackOverflow"),
            NameList(name: "Github"),
        ]
        
        newData.forEach { array.append($0) }
        
        return array
    }
    
}

class ViewController: UITableViewController {
    
    var data = NameList.getList()
    var alreadyRefresh = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        tableView.backgroundColor = .yellow
        tableView.separatorColor = .yellow
        tableView.allowsSelection = false
        
        navigationItem.title = "Where to learn Swift ?"
        
        setupNavBar()
        setupRefreshControl()
        
    }
    
    private func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        
        refreshControl?.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.purple,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)
        ]
        
        let attributedTitle = NSAttributedString(string: "Refreshing...", attributes: attributes)
        
        refreshControl?.attributedTitle = attributedTitle
        
        refreshControl?.tintColor = .purple
        
        guard let refresh = refreshControl else { return }
        tableView.addSubview(refresh)
        
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        if !alreadyRefresh {
            data = NameList.newList(list: data)
            
            self.tableView.reloadData()
            refreshControl.endRefreshing()
            
            alreadyRefresh = true
        } else {
            print("You have already refresh !")
            refreshControl.endRefreshing()
        }
    }
    
    func setupNavBar() {
        
        navigationController?.navigationBar.barTintColor = .purple
        
        let textColor = [NSAttributedStringKey.foregroundColor : UIColor.yellow]
        navigationController?.navigationBar.titleTextAttributes = textColor
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let data = self.data[indexPath.row]
        
        cell.backgroundColor = .purple
        cell.textLabel?.textColor = .yellow
        
        cell.textLabel?.text = data.name
        
        
        return cell
    }
    
}

