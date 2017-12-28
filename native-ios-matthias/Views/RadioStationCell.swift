//
//  RadioStationCell.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 24/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit

class RadioStationCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var radioStation: RadioStation! {
        didSet {
            nameLabel.text = radioStation.name
        }
    }

}
