//
//  ViewController.swift
//  Base Converter
//
//  Created by Fernando on 3/9/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueEntryTextfield: UITextField!
    @IBOutlet weak var binaryBtn: UIButton!
    @IBOutlet weak var decimalBtn: UIButton!
    
    let converter = BaseConverter()
    
    let placeholder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.5147656488, green: 0.5147656488, blue: 0.5147656488, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Menlo", size: 36.0)!])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(converter.encode(forNumber: 4, toBase: 2))
        valueEntryTextfield.attributedPlaceholder = placeholder
        
        valueEntryTextfield.addTarget(self, action: #selector(textFieldTextDidChange), for: .editingChanged)
        
        disableButtons()
        
        let binDigit = BinaryDecimal(145)
        print(binDigit.calculateBinaryValueForInt())
    }
    
    @objc func textFieldTextDidChange() {
        if valueEntryTextfield.text == "" {
            disableButtons()
        } else {
            binaryBtn.isEnabled = true
            binaryBtn.alpha = 1
            decimalBtn.isEnabled = true
            decimalBtn.alpha = 1
        }
    }
    
    func disableButtons() {
        binaryBtn.isEnabled = false
        binaryBtn.alpha = 0.5
        decimalBtn.isEnabled = false
        decimalBtn.alpha = 0.5
    }

    @IBAction func binaryBtnWasPressed(_ sender: UIButton) {
        if valueEntryTextfield.text != "" {
            binaryBtn.alpha = 1.0
            decimalBtn.alpha = 0.5
            guard let string = valueEntryTextfield.text else {return}
            let strings = string.split(separator: " ")
            var all_nums = [String]()
            for numbers in strings {
                guard let intFromString = Int(numbers) else {return}
                
                let binaryDigit = BinaryDecimal(intFromString)
                all_nums.append(binaryDigit.calculateBinaryValueForInt())
            }
            
            let new_str = all_nums.joined(separator: " ")
            valueEntryTextfield.text = "\(new_str)"
        }
    }
    
    @IBAction func decimalBtnWasPressed(_ sender: UIButton) {
        if valueEntryTextfield.text != "" {
            binaryBtn.alpha = 0.5
            decimalBtn.alpha = 1.0
            guard let string = valueEntryTextfield.text else {return}
            let strings = string.split(separator: " ")
            var all_nums = [String]()
            for numbers in strings {
                
                let bitsFromString = numbers.map { Int(String($0))! }
                let binaryDigit = BinaryDecimal(bitsFromString)
                all_nums.append(binaryDigit.calculateIntValueForBinary())
            }
            
            let new_str = all_nums.joined(separator: " ")
            valueEntryTextfield.text = "\(new_str)"
        }
    }
    
}

