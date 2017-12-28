//
//  Currency.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 21/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation
//import RealmSwift

class Currency {
    
    var name = ""
    
    var currencyArray : [String]  {
        get {
            return ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
        } 
    }
    
    var numCurrencies: Int {
        return currencyArray.count
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
        
}
