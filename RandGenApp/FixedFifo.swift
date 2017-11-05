//
//  FixedFifo.swift
//  RandGenApp
//
//  Created by Rune Haetta on 05/11/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import UIKit

class FixedFifo {
    
    var maxSize : Int
    var buffer = [Int]()
    
    init(_ maxSize : Int) {
        self.maxSize = maxSize
    }
    
    func append(_ n : Int)
    {
        buffer.append(n)
        while buffer.count > maxSize {
            buffer.removeFirst()
        }
    }
    
    func clear() {
        buffer.removeAll()
    }
}

