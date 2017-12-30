//
//  RadioStationViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 24/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit

class RadioStationViewController: UITableViewController {

    private var radioStations: [RadioStation]! = [RadioStation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        radioStations!.append(RadioStation(name: "IFM", image: "http://intergalactic.fm/shop/wp-content/uploads/2017/05/logo.png", url: "http://radio.intergalacticfm.com/2.m3u"))
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return radioStations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Set our cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "radiostationCell", for: indexPath) as! RadioStationCell

        // Configure the cell...
        if let r = radioStations?[indexPath.row]  {
            cell.radioStation = r
        } 

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "radiostationCell", for: indexPath) as! RadioStationCell
        
        // Set the radiostation in the player view
        if let splitControllers = self.splitViewController?.viewControllers {
            let radioPlayer = splitControllers[splitControllers.count - 1] as? RadioPlayerViewController
            radioPlayer?.radioStation = radioStations?[indexPath.row]
        }
    }
    

}
