//
//  InjectionTests.swift
//  AdvancedDataStructures
//
//  Created by Jeremie Benhamron on 2017-04-18.
//  Copyright © 2017 beenie.inc. All rights reserved.
//

import XCTest

@testable import AdvancedDataStructures


class InjectionTests: XCTestCase {
    
    var injection1 = Injection<Double,String>(pairs: [(0.1,"0.1"),(0.2,"0.2"),(0.4,"0.4")] )!
    var injection2 = Injection<Double,String>(pairs: [(0.1,"0.1"),(0.2,"0.2"),(0.4,"0.4")] )!
    
    var failedInjection1 = Injection<Double,String>(pairs: [(0.1,"0.1"),(0.1,"0.2"),(0.4,"0.4")] )
    var failedInjection2 = Injection<Double,String>(pairs: [(0.2,"0.1"),(0.2,"0.2"),(0.4,"0.4")] )
    var failedInjection3 = Injection<Double,String>(pairs: [(0.2,"0.2"),(0.2,"0.2"),(0.4,"0.4")] )

    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit(){
        XCTAssert(failedInjection1 ==  nil)
        XCTAssert(failedInjection2 ==  nil)
        XCTAssert(failedInjection3 ==  nil)
    }
    
    func testEquality() {
        XCTAssert(injection1 ==  injection2)
    }
    
    func testAdd(){
        XCTAssert(injection2[0.3] ==  nil)
        injection2[0.3] = "0.3"
        XCTAssert(injection2[0.3] ==  "0.3")
        
    }
    
    func testRemove(){
        XCTAssert(injection2[0.4] ==  "0.4")
        injection2[0.4] = nil
        XCTAssert(injection2[0.4] ==  nil)
    }
    
    func testLoop(){
        for (x,y) in injection2{
            print(x,y)
        }
    }
    
    func testProperties(){
        print(injection2.pairs)
        print(injection2.preImage)
        print(injection2.image)
        print(injection2.count)
        print(injection2.isEmpty)
        print(injection2.description)
        print(injection2)
    }
    
    
    func testReplace(){
        print(injection2.description)
        injection2[0.1] = "0.2"
        XCTAssert(injection2[0.2] == nil)
        XCTAssert(injection2["0.1"] == nil)
        XCTAssert(injection2.count == 2)
        XCTAssert(injection2[0.1] == "0.2")
        print(injection2.description)
        
    }
    
    
}

