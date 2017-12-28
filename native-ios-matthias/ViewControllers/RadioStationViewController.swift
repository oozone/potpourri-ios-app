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
        let cell = tableView.dequeueReusableCell(withIdentifier: "radiostationCell", for: indexPath) as! RadioStationCell

        // Configure the cell...
        if let r = radioStations?[indexPath.row]  {
            cell.radioStation = r
        } 

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "radiostationCell", for: indexPath) as! RadioStationCell
        
        if let splitControllers = self.splitViewController?.viewControllers {
            let radioPlayer = splitControllers[splitControllers.count - 1] as? RadioPlayerViewController
            radioPlayer?.radioStation = radioStations?[indexPath.row]
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
