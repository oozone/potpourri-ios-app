//
//  CryptoCoin.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation

class CryptoCoin {
    
    var name : String = ""
    var fullname : String = ""
    var imageUrl : String = ""
    var prices : [String: Double] = [:]
    
    convenience init(name : String, fullname : String, imageUrl : String){
        self.init()
        self.name = name
        self.fullname = fullname
        self.imageUrl = imageUrl
    }
}
