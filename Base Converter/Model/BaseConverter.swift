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
    
    func asciiEncode() {
        let string = "T"
        let binaryData: Data? = string.data(using: .utf8, allowLossyConversion: false)
        
        let stringOf01 = binaryData?.reduce("") { (acc, byte) -> String in
            acc + String(byte, radix: 2)
        }
        
        print(stringOf01!)
        
        let binaryBits = stringOf01!
        
//        var result = ""
//        var index = binaryBits.startIndex
//
//        while let next = binaryBits.index(index, offsetBy: 7, limitedBy: binaryBits.endIndex) {
//            let asciiCode = UInt8(binaryBits[index..<next], radix: 2)!
//            result.append(Character(UnicodeScalar(asciiCode)))
//            index = next
//        }
        
        // Sample use :
        let r = stringToBinaryString(myString: "HELP")
        print(r)

//        var index = binaryBits.startIndex
//        var result: String = ""
//        for _ in 0..<binaryBits.characters.count/8 {
//            let nextIndex = binaryBits.index(index, offsetBy: 8)
//            let charBits = binaryBits[index..<nextIndex]
//            result += String(UnicodeScalar(UInt8(charBits, radix: 2)!))
//            index = nextIndex
//        }
//        print(result)
    }
    
    func stringToBinaryString (myString:String) -> String {
        
        // Array of characters
        let characterArray = [Character](myString.characters)
        
        // Array of asccii value
        let asciiArray = characterArray.map({String($0).unicodeScalars.first!.value})
        
        // Array of binary value
        let binaryArray = asciiArray.map ({ String($0, radix: 2)})
        
        // Reduce in a String
        let r = binaryArray.reduce("",{"0" + $0 + " " + $1})
        
        return r
    }

}
