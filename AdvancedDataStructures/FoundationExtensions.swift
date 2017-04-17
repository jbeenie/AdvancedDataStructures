//
//  FoundationExtensions.swift
//  AdvancedDataStructures
//
//  Created by Jeremie Benhamron on 2017-04-17.
//  Copyright © 2017 beenie.inc. All rights reserved.
//

import Foundation

extension Dictionary where Value == Int{
    init(array:[Key]) {
        self.init()
        for (index,element) in array.enumerated(){
            self[element] = index
        }
    }
}
