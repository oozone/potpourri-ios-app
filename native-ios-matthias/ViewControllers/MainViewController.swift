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
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""
    
    var currency : Currency = Currency()
    
    
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    private var cryptoPrice: CryptoPrice? {
        didSet {
            if let cryptoPrice = cryptoPrice {
                cryptoPriceLabel.text = "\(cryptoPrice.last)℃"
            } else {
                cryptoPriceLabel.text = "Loading"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //currencyPicker.dataSource = self
        //currencyPicker.delegate = self
        
        //let statusIndex = Task.Status.values.index(of: task.status)!
        //currencyPicker.selectRow(0, inComponent: 0, animated: false)
        
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
            
            
            //return currencyArray[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            //let finalUrl = baseURL + currency.currencyArray[row]
            
            print(row)
            
            cryptoPrice = nil
            cryptoPriceTask?.cancel()
            cryptoPriceTask = CryptocurrencyPriceService.price(for: currency.currencyArray[row]) {
                self.cryptoPrice = $0
            }
            cryptoPriceTask!.resume()
            
        }
    }
    
    


