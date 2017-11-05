//
//  RandomStringGenerator.swift
//  RandGenApp
//
//  Created by Rune Haetta on 25/10/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import UIKit

class RandomStringGenerator {
    
    static let validChars = [Character]("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    
    func nextString(numbers : [Int]) -> String {
        
        let randomChars : [Character] = numbers.map({ (n: Int) -> Character in
            let r = Int(arc4random())
            let xor = r ^ n
            let index = xor % RandomStringGenerator.validChars.count
            let randomChar = RandomStringGenerator.validChars[abs(index)]
            
            return randomChar
        })
        
        return String(randomChars)
    }
}
