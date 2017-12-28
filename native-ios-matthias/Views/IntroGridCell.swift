//
//  IntroGridCellCollectionViewCell.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 23/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit

class IntroGridCell: UICollectionViewCell {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var category: Category! {
        didSet {
            titleLabel.text = category.title
            iconLabel.text = category.icon
        }
    }
    
    
}
