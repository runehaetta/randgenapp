//
//  RandomStringGeneratorTests.swift
//  RandGenAppTests
//
//  Created by Rune Haetta on 25/10/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import XCTest
@testable import RandGenApp

class RandomStringGeneratorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNextStringCount() {
        
        let randomStringGenerator = RandomStringGenerator()
        
        let zeros = [Int](repeating: 0, count: 8)
        let nextString = randomStringGenerator.nextString(numbers: zeros)
        
        XCTAssertEqual(8, nextString.count)
    }
    
    func testNextStringContent() {
        
        let randomStringGenerator = RandomStringGenerator()
        
        let zeros = [Int](repeating: 0, count: 8)
        let nextString = randomStringGenerator.nextString(numbers: zeros)
        
        let stringCount = nextString.reduce(0, { n, c in
            if RandomStringGenerator.validChars.contains(c) {
                return n + 1
            }
            return n
        })
        
        XCTAssertEqual(8, stringCount)
    }
    
}
