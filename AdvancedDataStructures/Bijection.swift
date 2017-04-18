//
//  Bijection.swift
//  AdvancedDataStructures
//
//  Created by Jeremie Benhamron on 2017-04-16.
//  Copyright © 2017 beenie.inc. All rights reserved.
//

import Foundation

struct Bijection<Domain:Hashable,Codomain:Hashable>{
    //MARK: - Public API
    
    //MARK: Computed Properties
    
    //MARK: Stored Properties
    var preImage:[Domain]{
        return _preImage
    }
    var image:[Codomain]{
        return _image
    }
    
    
    var isEmpty:Bool{
        return preImage.isEmpty
    }
    
    var pairs:[(Domain,Codomain)]{
        return preImage.enumerated().map
            {(i:Int,x:Domain)->(Domain,Codomain) in return (x,image[i])}
    }
    
    var description:String{
        var description = ""
        guard !isEmpty else {return description}
        description += "\(pairs[0])"
        for pair in pairs.suffix(from: 1){
            description += ", \(pair)"
        }
        return description
    }
    
    //MARK:  Subscritps
    
    subscript(x:Domain)-> Codomain?{
        get{
            return getImage(of: x)
        }
        
        set(y){
            //y is non nil map x to y
            if let y = y{
                map(x: x, toY: y)
            }else{
                //if y is nil unmap x
                unMap(x: x)
            }
        }
    }
    
    
    subscript(y:Codomain)-> Domain?{
        get{
            return getPreImage(of: y)
        }
        
        set(x){
            //x is non nil map x to y
            if let x = x{
                map(x: x, toY: y)
            }else{
                //if x is nil unmap y
                unMap(y: y)
            }
        }
    }
    
    //MARK: - Initializers
    
    init() {
        self.init(pairs: [])
    }
    
    init?(preImage:[Domain], image:[Codomain]) {
        guard preImage.count == image.count else {return nil}
        self._preImage = preImage
        self._image = image
    }
    
    init(pairs:[(Domain,Codomain)]) {
        self._preImage = [Domain]()
        self._image = [Codomain]()
        //Populate domain and codomain using pairs
        for (x,y) in pairs{
            self.map(x: x, toY: y)
        }
    }
    
    //MARK: - Private implementation Logic
    
    //MARK: Stored Properties
    private var _preImage:[Domain]
    private var _image:[Codomain]
    
    //MARK: - Getters
    private func getImage(of x:Domain)->Codomain?{
        guard let i = _preImage.index(of: x) else {return nil}
        return _image[i]
    }
    
    
    private func getPreImage(of y:Codomain)->Domain?{
        guard let i = _image.index(of: y) else {return nil}
        return _preImage[i]
    }
    
    //MARK: - Setters
    
    
    //if x or y are already mapped to other elements 
    //this functions first removes those mappings
    // and then maps x to y to ensure bijectivity
    private mutating func map(x:Domain, toY y:Codomain){
        unMap(x: x)
        unMap(y: y)
        _preImage.append(x)
        _image.append(y)
    }
    
    private mutating func unMap(x:Domain){
        guard let i = _preImage.index(of: x) else {return}
        _preImage.remove(at: i)
        _image.remove(at: i)
    }
    
    private mutating func unMap(y:Codomain){
        guard let i = _image.index(of: y) else {return}
        _preImage.remove(at: i)
        _image.remove(at: i)
    }
}

extension Bijection:Equatable{
    static func ==(lhs: Bijection<Domain,Codomain>, rhs: Bijection<Domain,Codomain>) -> Bool{
        return lhs.preImage == lhs.preImage && lhs.image == lhs.image
    }
}

extension Bijection:Collection{
    typealias Index = Int
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return self.preImage.count
    }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    subscript(index: Int)->(Domain,Codomain){
        return self.pairs[index]
    }
}
