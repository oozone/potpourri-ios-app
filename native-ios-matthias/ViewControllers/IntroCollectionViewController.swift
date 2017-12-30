//
//  IntroCollectionViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 23/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit



class IntroCollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate {

    private let reuseIdentifier = "introCell"
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categories.append(Category(title: "CryptoCoin", icon: "💸", segue: "cryptoSegue", info: "Check cryptocoin prices"))
        categories.append(Category(title: "Bitcoin Converter", icon: "⚖️", segue: "converterSegue", info: "Convert bitcoin in different currencies"))
        categories.append(Category(title: "Relax", icon: "🐰", segue: "relaxSegue", info: "Relax with some radio"))
        categories.append(Category(title: "Map", icon: "🌎", segue: "mapSegue", info: "Map View Showboating"))
        
        
        // On Long press show alert with more info
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(IntroCollectionViewController.longPressHandler))
        longPress.minimumPressDuration = 0.6
        longPress.delegate = self
        self.collectionView?.addGestureRecognizer(longPress)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // not needed, but maybe we want to change this
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IntroGridCell
    
        // Set cell from indexpath
        cell.category = categories[indexPath.item]
        
        return cell
    }


    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Perform segue bases on category segue id
        performSegue(withIdentifier: categories[indexPath.row].segue, sender: nil)
    }
    
    // Compiler error without @objc
    //
    //   Long press handler for collectionview item
    //
    @objc public func longPressHandler(gest: UILongPressGestureRecognizer){
        
        // Find point in collection
        let point = gest.location(in: self.collectionView)
        let indexPath = self.collectionView?.indexPathForItem(at: point)
        
        if let position = indexPath {
            
            // get category
            let cat = categories[position.row]
            
            // Source: https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
            let alert = UIAlertController(title: cat.title, message: cat.info, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}


