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
    
    
    var seconds = 0.0
    var timer = Timer()
    var isTimerRunning = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSetImagePlayButton()
        customSetImagePauseButton()
    }
    
    // MARK : @IBAction methods
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        runTimer()
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    
    
    
    // MARK : Private methods
    
    @objc private func updateTimer() {
        seconds += 0.1
        timeLabel.text = "\(seconds)"
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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

