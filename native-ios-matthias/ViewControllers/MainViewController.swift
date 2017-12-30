//
//  MainController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 21/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit


class MainViewController: UIViewController{

    
    private var cryptoPriceTask: URLSessionTask?
    
    var currentRow : Int = 0
    var currency : Currency = Currency()
    
    
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    private var cryptoPrice: CryptoPrice? {
        
        // If cryptoprice changed, update cryptopricelabel text
        didSet {
            if let cryptoPrice = cryptoPrice {
                cryptoPriceLabel.text = "\(cryptoPrice.last) \(currency.currencyArray[currentRow])"
            } else {
                cryptoPriceLabel.text = "Loading"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

    extension MainViewController: UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return currency.numCurrencies
            
        }
    }
    
    extension MainViewController: UIPickerViewDelegate {
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return currency.currencyArray[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            currentRow = row
            cryptoPrice = nil
            cryptoPriceTask?.cancel()
            cryptoPriceTask = CryptocurrencyPriceService.price(for: currency.currencyArray[row]) {
                self.cryptoPrice = $0
            }
            cryptoPriceTask!.resume()
            
        }
    }
    
    


