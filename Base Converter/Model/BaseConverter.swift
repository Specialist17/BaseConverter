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
        
        assert(2 <= base && base <= 36)
        
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
    
    
    func encode(forNumber number: Int, toBase base: Int) -> String {
        assert(2 <= base && base <= 36)
        assert(number >= 0)
        
        var digitList = [String]()
        var currentQuotient = number
        
        var num = Int(String(ENCODING_CHARACTERS[currentQuotient % base]!))!
        
        digitList.append(String(ENCODING_CHARACTERS[currentQuotient % base]!))
        
        while floor(Double(currentQuotient) / Double(base)) > 0 {
            currentQuotient = Int(floor(Double(currentQuotient) / Double(base)))
            digitList.append(String(ENCODING_CHARACTERS[currentQuotient % base]!))
        }
        
        return String(digitList.joined(separator: "").reversed())
    }
}
