//
//  ViewController.swift
//  Project 14 - EmojiSlotMachine
//
//  Created by Christophe Bugnon on 14/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let picker: UIPickerView = {
        let pv = UIPickerView()
        pv.isUserInteractionEnabled = false
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    let turnPickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("Good luck !", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.alpha = 0.8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backgroundPicture: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "casino"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.alpha = 0.5
        iv.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return iv
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Apple Color Emoji", size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataEmoji = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐸", "🐵"]
    
    var array1 = [Int]()
    var array2 = [Int]()
    var array3 = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundPicture)
        
        picker.delegate = self
        picker.dataSource = self
        
        setupUI()
        
        turnPickerButton.addTarget(self, action: #selector(turnPickerView), for: .touchUpInside)
        
        addNumberInArray()
    }
    
    @objc private func turnPickerView() {
        
        for component in 0...2 {
            self.picker.selectRow(getRandomNumber(number: 14), inComponent: component, animated: true)
        }
        
        getResult()
        
    }
    
    func getResult() {
        if array1[picker.selectedRow(inComponent: 0)] == array2[picker.selectedRow(inComponent: 1)] && array2[picker.selectedRow(inComponent: 1)] == array3[picker.selectedRow(inComponent: 2)] {
            resultLabel.text = "❤️"
        } else {
            resultLabel.text = "💔"
        }
    }
    
    private func addNumberInArray() {
        
        for _ in 0...100 {
            array1.append(getRandomNumber(number: dataEmoji.count))
            array2.append(getRandomNumber(number: dataEmoji.count))
            array3.append(getRandomNumber(number: dataEmoji.count))
        }
    }
    
    private func getRandomNumber(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    private func setupUI() {
        
        view.addSubview(picker)
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        picker.widthAnchor.constraint(equalToConstant: 300).isActive = true
        picker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(turnPickerButton)
        turnPickerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        turnPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        turnPickerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        turnPickerButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        view.addSubview(resultLabel)
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 60).isActive = true
        resultLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
