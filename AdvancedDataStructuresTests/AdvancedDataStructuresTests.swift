//
//  AdvancedDataStructuresTests.swift
//  AdvancedDataStructuresTests
//
//  Created by Jeremie Benhamron on 2017-04-16.
//  Copyright © 2017 beenie.inc. All rights reserved.
//

import XCTest

@testable import AdvancedDataStructures

class AdvancedDataStructuresTests: XCTestCase {
    
    var bijection1 = Injection<Double,String>(pairs: [(0.1,"0.1"),(0.2,"0.2"),(0.4,"0.4")] )
    var bijection2 = Injection<Double,String>(pairs: [(0.1,"0.1"),(0.2,"0.2"),(0.4,"0.4")] )
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEquality() {
        XCTAssert(bijection1 ==  bijection2)
    }
    
    func testAdd(){
        XCTAssert(bijection2[0.3] ==  nil)
        bijection2[0.3] = "0.3"
        XCTAssert(bijection2[0.3] ==  "0.3")

    }
    
    func testRemove(){
        XCTAssert(bijection2[0.4] ==  "0.4")
        bijection2[0.4] = nil
        XCTAssert(bijection2[0.4] ==  nil)
    }
    
    func testLoop(){
        for (x,y) in bijection2{
            print(x,y)
        }
    }
    
    func testProperties(){
        print(bijection2.pairs)
        print(bijection2.preImage)
        print(bijection2.image)
        print(bijection2.count)
        print(bijection2.isEmpty)
        print(bijection2.description)
        print(bijection2)
    }

    
    func testReplace(){
        print(bijection2.description)
        bijection2[0.1] = "0.2"
        XCTAssert(bijection2[0.2] == nil)
        XCTAssert(bijection2["0.1"] == nil)
        XCTAssert(bijection2.count == 2)
        XCTAssert(bijection2[0.1] == "0.2")
        print(bijection2.description)

    }
    
    
}
