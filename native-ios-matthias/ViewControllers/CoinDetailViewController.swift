//
//  CoinDetailViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation
import UIKit


class CoinDetailViewController: CryptoCompareViewController{
    
    @IBOutlet weak var coinName: UILabel!
    
    var cryptoCoin : CryptoCoin!
    @IBOutlet weak var eurPrice: UILabel!
    @IBOutlet weak var usdPrice: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the cryptocoin from the tab controller
        if let cdtc = self.tabBarController as? CoinDetailTabController {
            self.cryptoCoin = cdtc.cryptoCoin
        }
        
        if let name = cryptoCoin?.name {
            coinName.text = name
            coinImage.downloadedFrom(link: "https://www.cryptocompare.com" + cryptoCoin.imageUrl)
        }
        
        // Set our price data
        self.setPriceData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func setPriceData(){
        cryptoCoinTask?.cancel()
        
        // Service to get the cryptocoin price data
        cryptoCoinTask = CryptocompareService.coinprice(for: cryptoCoin) {
            self.cryptoCoin = $0
            
            self.eurPrice.text = self.cryptoCoin!.prices["EUR"]?.toCurrencyString()
            self.usdPrice.text = self.cryptoCoin!.prices["USD"]?.toCurrencyString()
        }
        cryptoCoinTask!.resume()
        
        
    }
    
    
}


