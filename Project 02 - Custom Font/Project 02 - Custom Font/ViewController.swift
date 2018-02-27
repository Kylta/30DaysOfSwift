//
//  ViewController.swift
//  Project 02 - Custom Font
//
//  Created by Christophe Bugnon on 27/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let titleCell = ["Hello this is the first cell", "And me, i'm the second ! 😃", "Nice too be near you budy", "god, why did i'm always the last ? 😭"]
    let fontName = ["Gaspar Regular", "MFJinHei_Noncommercial-Regular", "MFTongXin_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    var currentFontIndex = 0
    
    let cellId = "cellId"
    
    @IBOutlet weak var buttonCustom: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*
        tableView.delegate = self
        tableView.dataSource = self
         */
        
        view.backgroundColor = .black
        buttonCustom.layer.cornerRadius = 0.5 * buttonCustom.bounds.size.width
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func changeFont(_ sender: UIButton) {
        currentFontIndex = (currentFontIndex + 1) % 4
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        setupTable(tableView, cell)

        cell.textLabel?.text = titleCell[indexPath.row]
        cell.textLabel?.font = UIFont(name: fontName[currentFontIndex], size: 16)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    fileprivate func setupTable(_ tableView: UITableView, _ cell: UITableViewCell) {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.selectionStyle = .none
    }
    
    
    
    
}


