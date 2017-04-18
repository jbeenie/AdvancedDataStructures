//
//  MappingTests.swift
//  AdvancedDataStructures
//
//  Created by Jeremie Benhamron on 2017-04-18.
//  Copyright © 2017 beenie.inc. All rights reserved.
//

import XCTest

@testable import AdvancedDataStructures


class MappingTests: XCTestCase {
    

    
    lazy var map = Mapping<Double,String>(map:
        { d in
        return String(d)
    }
        , inverse: { s in
            return Double(s) ?? 0.0
    })
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
      
        XCTAssert(map[5.5] ==  "5.5")
        XCTAssert(map["5.5"] ==  5.5)

    }
    

}
