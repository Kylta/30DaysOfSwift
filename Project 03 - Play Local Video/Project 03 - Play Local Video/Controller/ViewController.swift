//
//  ViewController.swift
//  Project 03 - Play Local Video
//
//  Created by Christophe Bugnon on 28/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var data = [
        VideoModel(image: "brooklyn-nine-nine", title: "Brooklyn nine-nine", source: "Youtube - 2:06", url: "brooklyn-nine-nine"),
        VideoModel(image: "manhunt", title: "Manhunt - Unabomber", source: "Youtube - 2:21", url: "manhunt"),
        VideoModel(image: "mindhunter", title: "Mindhunter", source: "Youtube - 2:09", url: "mindhunter-official-trailer-hd-netflix"),
        VideoModel(image: "mr.robot", title: "Mr. Robot", source: "Youtube - 2:24", url: "mr-robot-season-1-trailer"),
        VideoModel(image: "breaking-bad", title: "Breaking Bad", source: "Youtube - 2:07", url: "breaking-bad-trailer-first-season")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusAndNavigationBar()
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Watch Later"
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let path = Bundle.main.path(forResource: data[indexPath.item].url, ofType: "mp4") else { debugPrint("video.mp4 not found"); return }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        self.present(playerController, animated: true) {
            playerController.player!.play()
            
        }
    }
    
    private func setupStatusAndNavigationBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let videoCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        
        let video = data[indexPath.item]
        
        videoCell.video = video
        
        return videoCell
    }
    
}

