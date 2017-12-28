//
//  RadioStation.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 24/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation

class RadioStation {
    
    var name : String = ""
    var image : String = ""
    var url : String = ""
    
    init(name : String, image : String, url: String){
        //self.init()
        self.name = name
        self.image = image
        self.url = url
    }
}
