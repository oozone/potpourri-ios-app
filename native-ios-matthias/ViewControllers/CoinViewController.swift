//
//  CoinViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation
import UIKit


class CoinViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoCoinTask: URLSessionTask?
    
    private var cryptoCoins: [CryptoCoin]!
    
    private var indexPathToView: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load our coins in tableview
        cryptoCoins = nil
        cryptoCoinTask?.cancel()
        cryptoCoinTask = CryptocompareService.coinlist() {
            self.cryptoCoins = $0
            
            // Reload table data
            self.tableView!.reloadData()
        }
        cryptoCoinTask!.resume()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch  segue.identifier {
        case "detailCoin"?:
            
            // Set selected cryptocoin to destination controller
            let dest = segue.destination as! CoinDetailTabController
            let selection = tableView.indexPathForSelectedRow!
            dest.cryptoCoin = self.cryptoCoins[selection.row]
            
        default:
            fatalError("Unknown segue")
        }
    }
    
    
    
}


extension CoinViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Only get 20 coins, the list is looooong!!!
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Set our cryptocell name & imageicon
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCell
        if let wr = cryptoCoins?[indexPath.row]  {
            cell.name = wr.fullname
            cell.imageIcon = "https://www.cryptocompare.com" + wr.imageUrl
        } else {
            cell.name = "N/A"
        }
        
        return cell
    }
}


extension CoinViewController: UITableViewDelegate {
    
}


