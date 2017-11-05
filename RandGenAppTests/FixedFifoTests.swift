//
//  FixedFifoTests.swift
//  RandGenAppTests
//
//  Created by Rune Haetta on 05/11/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import XCTest
@testable import RandGenApp

class FixedFifoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAppend0() {
        let fifo = FixedFifo(3)
        
        for i in 1...3 {
            fifo.append(i)
        }
        
        XCTAssertEqual(1, fifo.buffer[0])
        XCTAssertEqual(2, fifo.buffer[1])
        XCTAssertEqual(3, fifo.buffer[2])
    }

    func testAppend1() {
        let fifo = FixedFifo(3)
        
        for _ in 1...4 {
            fifo.append(0)
        }
        
        XCTAssertEqual(3, fifo.buffer.count)
    }
    
    func testAppend2() {
        let fifo = FixedFifo(3)
        
        for i in 1...4 {
            fifo.append(i)
        }
        
        XCTAssertEqual(2, fifo.buffer[0])
    }
}
