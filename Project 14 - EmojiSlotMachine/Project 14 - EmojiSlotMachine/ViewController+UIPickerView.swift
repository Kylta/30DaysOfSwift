//
//  ViewController+UIPickerView.swift
//  Project 14 - EmojiSlotMachine
//
//  Created by Christophe Bugnon on 14/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataEmoji.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        switch component {
        case 0: pickerLabel.text = dataEmoji[array1[row]]
        case 1: pickerLabel.text = dataEmoji[array2[row]]
        case 2: pickerLabel.text = dataEmoji[array3[row]]
        default: break
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        
        getResult()
        
        return pickerLabel
    }
    
}


