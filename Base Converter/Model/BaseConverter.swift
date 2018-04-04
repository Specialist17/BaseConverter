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
        
        digitList.append(String(ENCODING_CHARACTERS[currentQuotient % base]!))
        
        while floor(Double(currentQuotient) / Double(base)) > 0 {
            currentQuotient = Int(floor(Double(currentQuotient) / Double(base)))
            digitList.append(String(ENCODING_CHARACTERS[currentQuotient % base]!))
        }
        
        return String(digitList.joined(separator: "").reversed())
    }
    
    /* Convert given digits in base1 to digits in base2.
        digits: str -- string representation of number (in base1)
        base1: int -- base of given number
        base2: int -- base to convert to
        return: str -- string representation of number (in base2)
     */
    func convert(digits: String, base1: Int, base2: Int) -> String{
        //Handle up to base 36 [0-9a-z]
        
        if base1 == 0 {
            let string = asciiEncode(text: digits)
            return string
        }
        
        if base2 == 0 {
            let string = stringToBinaryString(myString: digits)
            return string
        }
        
        assert (2 <= base1 && base1 <= 36)
        assert (2 <= base2 && base2 <= 36)
        //TODO: Convert digits from base 2 to base 16 (and vice versa)
        
        if base1 == 10{
            return encode(forNumber: Int(digits)!, toBase: base2)
        } else{
            let base_10_repr = decode(forDigits: digits, withBase: base1)
            return encode(forNumber: base_10_repr, toBase: base2)
        }
    }
    
    func asciiEncode(text: String) -> String{

        var index = text.startIndex
        var result: String = ""
        for _ in 0..<text.count/8 {
            let nextIndex = text.index(index, offsetBy: 8)
            let charBits = text[index..<nextIndex]
            result += String(UnicodeScalar(UInt8(charBits, radix: 2)!))
            index = nextIndex
        }
        return result
    }
    
    func stringToBinaryString (myString:String) -> String {
        
        // Array of characters
        let characterArray = [Character](myString)
        
        // Array of asccii value
        let asciiArray = characterArray.map({String($0).unicodeScalars.first!.value})
        
        // Array of binary value
        let binaryArray = asciiArray.map ({ String($0, radix: 2)})
        
        // Reduce in a String
        let r = binaryArray.reduce("",{
            if $1.count == 6 {
                return $0 + "00" + $1 + " "
            } else if $1.count == 7{
                return $0 + "0" + $1 + " "
            } else {
                return $0 + $1 + " "
            }
            
        })
        
        return r
    }

}
