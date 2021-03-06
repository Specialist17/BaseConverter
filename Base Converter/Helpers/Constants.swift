//
//  Constants.swift
//  Base Converter
//
//  Created by Fernando on 3/14/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import Foundation

let ENCODING_CHARACTERS: [Int: Character] = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6",
    7: "7", 8: "8", 9: "9", 10: "A", 11: "B", 12: "C", 13: "D", 14: "E",
    15: "F", 16: "G", 17: "H", 18: "I", 19: "J", 20: "K", 21: "L",
    22: "M", 23: "N", 24: "O", 25: "P", 26: "Q", 27: "R", 28: "S",
    29: "T", 30: "U", 31: "V", 32: "W", 33: "X", 34: "Y", 35: "Z"]

let DECODING_CHARACTERS: [Character: Int] = ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6,
    "7": 7, "8": 8, "9": 9, "a": 10, "b": 11, "c": 12 , "d": 13 , "e": 14 ,
    "f": 15 , "g": 16 , "h": 17 , "i": 18 , "j": 19 , "k": 20 , "l": 21 ,
    "m": 22 , "n": 23 , "o": 24 , "p": 25 , "q": 26 , "r": 27 , "s": 28 ,
    "t": 29 , "u": 30 , "v": 31 , "w": 32 , "x": 33 , "y": 34 , "z": 35 ,
    "A": 10, "B": 11, "C": 12 , "D": 13 , "E": 14 ,
    "F": 15 , "G": 16 , "H": 17 , "I": 18 , "J": 19 , "K": 20 , "L": 21 ,
    "M": 22 , "N": 23 , "O": 24 , "P": 25 , "Q": 26 , "R": 27 , "S": 28 ,
    "T": 29 , "U": 30 , "V": 31 , "W": 32 , "X": 33 , "Y": 34 , "Z": 35 ]

let CONVERSION_TYPES: [String:Int] = ["BINARY": 2,"OCTAL": 8, "DECIMAL": 10, "HEXADECIMAL": 16, "ASCII": 0]
