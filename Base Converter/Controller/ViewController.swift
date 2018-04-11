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
    @IBOutlet weak var basePicker: UIPickerView!
    
    let converter = BaseConverter()
    
    let placeholder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.5147656488, green: 0.5147656488, blue: 0.5147656488, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Menlo", size: 36.0)!])
    override func viewDidLoad() {
        super.viewDidLoad()
        basePicker.dataSource = self
        basePicker.delegate = self
        
        valueEntryTextfield.attributedPlaceholder = placeholder
        
        converter.asciiEncode()
        
        valueEntryTextfield.addTarget(self, action: #selector(textFieldTextDidChange), for: .editingChanged)
    }
    
    @objc func textFieldTextDidChange() {
       
    }
    
    func disableButtons() {
       
    }

    @IBAction func convertBtnWasPressed(_ sender: UIButton) {
        if valueEntryTextfield.text != "" {
          
            guard let string = valueEntryTextfield.text else {return}
            let strings = string.split(separator: " ")
            var all_nums = [String]()
            for numbers in strings {
//                guard let intFromString = Int(numbers) else {return}
//
//                let binaryDigit = BinaryDecimal(intFromString)
                let result = converter.decode(forDigits: String(numbers), withBase: 16)
                all_nums.append("\(result)")
            }
            
            let new_str = all_nums.joined(separator: " ")
            valueEntryTextfield.text = "\(new_str)"
        }
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CONVERSION_TYPES.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CONVERSION_TYPES[row]
    }
}

