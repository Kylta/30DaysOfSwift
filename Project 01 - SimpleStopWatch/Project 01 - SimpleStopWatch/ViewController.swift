//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by Christophe Bugnon on 26/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // @IBOutlet
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    // Variables
    var count = 0
    var timer = Timer()
    var resumeTapped = false
    var startTime = TimeInterval()
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSetImagePlayButton()
        customSetImagePauseButton()
    }
    
    // MARK : @IBAction methods
    @IBAction func startButtonTapped(_ sender: UIButton) {
        isRunning ? self.isRunning = true : runTimer()
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        resumeTapped ? self.resumeTapped = true : timer.invalidate()
        isRunning = false
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
        isRunning = false
    }
    
    // MARK : Private methods
    
    @objc private func updateTimer() {
        count += 1
        timeLabel.text = timeString(time: TimeInterval(count))
    }
    
    private func timeString(time: TimeInterval) -> String {
        let timeMs = time / 1000
        print(timeMs)
        let minutes = Int((timeMs/60).truncatingRemainder(dividingBy: 60))
        let seconds = Int((timeMs).truncatingRemainder(dividingBy: 60))
        let ms = Int((timeMs*100).truncatingRemainder(dividingBy: 100))
        
        return String(format:"%02d:%02d:%02d", minutes, seconds, ms)
    }
    
    private func runTimer() {
        self.resumeTapped = false
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
