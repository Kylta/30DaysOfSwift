//
//  ViewController.swift
//  Project 16 - SlideMenu
//
//  Created by Christophe Bugnon on 15/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

struct ModelSong {
    var name: String
    var title: String
    var imageSong: UIImage
    var iconArtist: UIImage
    
    static func getData() -> [ModelSong] {
        
        let data = [
        ModelSong(name: "Angel, JME, Wretch 32, Tally", title: "Rude Boy Remix", imageSong: #imageLiteral(resourceName: "rude_boy"), iconArtist: #imageLiteral(resourceName: "Wretch 32")),
        ModelSong(name: "Wiley ft. JME", title: "Call the shots", imageSong: #imageLiteral(resourceName: "call_the_shots"), iconArtist: #imageLiteral(resourceName: "wiley")),
        ModelSong(name: "Lady Leshurr", title: "New freezer", imageSong: #imageLiteral(resourceName: "new_freezer"), iconArtist: #imageLiteral(resourceName: "lady leshurr")),
        ModelSong(name: "Skepta", title: "Shutdown", imageSong: #imageLiteral(resourceName: "shutdown"), iconArtist: #imageLiteral(resourceName: "skepta")),
        ModelSong(name: "Kelvyn Colt", title: "Bury me alive", imageSong: #imageLiteral(resourceName: "Bury_me_Alive"), iconArtist: #imageLiteral(resourceName: "kelvyn colt")),
        ModelSong(name: "Stefflon Don ft. Skepta", title: "Ding-a-ling", imageSong: #imageLiteral(resourceName: "don_ding"), iconArtist: #imageLiteral(resourceName: "stefflon don"))
        ]
        
        return data
    }
}

struct MenuData {
    var name: String
    var icon: UIImage
}

class ViewController: UITableViewController {
    
    var modelSong: ModelSong?
    
    var settingMenu = SettingMenu()
    
    let data = ModelSong.getData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 70/255, green: 78/255, blue: 105/255, alpha: 1)
        
        tableView.register(ArtistCell.self, forCellReuseIdentifier: "cellId")
        
        setupNavBar()
        
    }
    
    private func setupNavBar() {
        navigationItem.title = "GRIME"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        
        let attributesNavBar : [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont(name: "ThirstySoftRegular", size: 24)!
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attributesNavBar
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 66/255, blue: 97/255, alpha: 1)
    }
    
    @objc func handleMenu() {
//        print("Pressed HandleMenu")
        settingMenu.showSettings(view: view)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ArtistCell
        
        let song = data[indexPath.row]
        
        cell.modelSong = song
        
        return cell
    }

}

