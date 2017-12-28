//
//  CryptoPrice.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 21/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation

class CryptoPrice {
    
    var high : Double = 0.0
    var last: Double = 0.0
    
    convenience init(last: Double, high: Double){
        self.init()
        self.high = high
        self.last = last
    }
}
