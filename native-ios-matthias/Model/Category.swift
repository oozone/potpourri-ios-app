//
//  Category.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 23/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation

class Category {
    
    var title : String = ""
    var icon : String = ""
    var segue : String = ""
    var info : String = ""
    
    convenience init(title : String, icon : String, segue: String, info: String){
        self.init()
        self.title = title
        self.icon = icon
        self.segue = segue
        self.info = info
    }
}
