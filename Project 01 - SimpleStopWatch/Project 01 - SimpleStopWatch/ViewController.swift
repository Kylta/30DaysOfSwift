//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by Christophe Bugnon on 26/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSetImagePlayButton()
        customSetImagePauseButton()
    }
    
    private func customSetImagePlayButton() {
        playButton.setImage(UIImage(named: "Play")?.withRenderingMode(.alwaysTemplate), for: .normal)
        playButton.tintColor = .white
    }
    
    private func customSetImagePauseButton() {
        pauseButton.setImage(UIImage(named: "Pause")?.withRenderingMode(.alwaysTemplate), for: .normal)
        pauseButton.tintColor = .white
    }


}

