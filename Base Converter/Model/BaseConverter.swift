//
//  BaseConverter.swift
//  Base Converter
//
//  Created by Fernando on 3/14/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import Foundation

struct BaseConverter {
    
    func decode(forDigits digits: String, withBase base: Int) -> Int {
        let digitList = String(digits.reversed())
        var level = 1
        var totalSum = 0
        
        for digit in digitList {
            var value = 0
            if base > 10 {
                value = level * DECODING_CHARACTERS[digit]!
            } else {
                value = level * Int(String(digit))!
            }
            
            totalSum += value
            level = level * base
        }
        
        return totalSum
    }
    
}
