//
//  Mapping.swift
//  AdvancedDataStructures
//
//  Created by Jeremie Benhamron on 2017-04-17.
//  Copyright © 2017 beenie.inc. All rights reserved.
//

import Foundation

public struct Mapping<Domain,Codomain>{
    var map: (Domain)->Codomain
    var inverse: (Codomain)->Domain
    
    public subscript(x:Domain)-> Codomain{
        get{
            return map(x)
        }
        
    }
    
    
    public subscript(y:Codomain)-> Domain{
        get{
            return inverse(y)
        }
    }
    
}
