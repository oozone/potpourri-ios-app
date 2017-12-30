//
//  CryptoCell.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    //@IBOutlet weak var colorView: UIView!
    //@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var coinIcon: UIImageView!
    
    
    
    var name : String! {
    didSet {
        if name != nil {
            nameLabel.text = name
        }
        
        }
    }
    
    var imageIcon : String! {
        didSet {
            if imageIcon != nil {
                //print(imageIcon)
                coinIcon.downloadedFrom(link: imageIcon)
            }
            
        }
    }
    
}
