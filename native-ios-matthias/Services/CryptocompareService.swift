//
//  CryptocompareService.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation
import SwiftyJSON


// Enum so we don't try to initialize this service
// SwiftyJSON: https://github.com/SwiftyJSON/SwiftyJSON
enum CryptocompareService {
    
    private static let session = URLSession(configuration: .ephemeral)
    private static let baseUrl = "https://min-api.cryptocompare.com/data"
    
    static func coinlist(completion: @escaping ([CryptoCoin]?) -> Void) -> URLSessionTask {
        let path = "/all/coinlist"
        let url = URL(string: self.baseUrl + path)!
        
        return session.dataTask(with: url) {
            data, response, error in
            
            let completion: ([CryptoCoin]?) -> Void = {
                price in
                DispatchQueue.main.async {
                    completion(price)
                }
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data else {
                    completion(nil)
                    return
            }
//            guard let result = try? JSONSerialization.jsonObject(with: data),
//                let json = result as? [String: Any] else {
//                    completion(nil)
//                    return
//            }
            
            // Init cryptocoin array
            var cryptos = [CryptoCoin]()
            // Try to set jsonobject
            let jsonObject = try? JSON(data: data)
            
            var i : Int = 0
            
            // Loop over jsonobject data
            for (_, aCoin) in jsonObject!["Data"] {
                
                // Set to vars for readability
                let name = aCoin["Name"].stringValue
                let imageUrl = aCoin["ImageUrl"].stringValue
                let fullname = aCoin["FullName"].stringValue
                
                let c = CryptoCoin(name: name, fullname: fullname, imageUrl: imageUrl)
                // Append to array
                cryptos.append(c)
                
                // Break at 20, this is a reaaaaally long coinlist, probably unworkable memory-wise
                if i > 20{ break }
                i += 1
            }
            
            completion(cryptos)
        }
    }
    
    static func coinprice(for cryptoCoin: CryptoCoin, completion: @escaping (CryptoCoin?) -> Void) -> URLSessionTask {
        let path = "/price?fsym=\(cryptoCoin.name)&tsyms=BTC,USD,EUR"
        let url = URL(string: self.baseUrl + path)!
        
        return session.dataTask(with: url) {
            data, response, error in
            
            let completion: (CryptoCoin?) -> Void = {
                price in
                DispatchQueue.main.async {
                    completion(price)
                }
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data else {
                    completion(nil)
                    return
            }

            // Try to set our json-object
            let jsonObject = try? JSON(data: data)
            
            // Loop over jsonobject and set prices
            for (key, price) in jsonObject! {
                cryptoCoin.prices[key] = price.doubleValue
            }

            completion(cryptoCoin)
        }
    }
}



