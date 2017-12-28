//
//  CryptocurrencyPriceService.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 21/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation

enum CryptocurrencyPriceService {
    
    private static let session = URLSession(configuration: .ephemeral)
    
    
    static func price(for name : String, completion: @escaping (CryptoPrice?) -> Void) -> URLSessionTask {
        let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
        let url = URL(string: baseURL + name)!
        
        
        return session.dataTask(with: url) {
            data, response, error in
            
            let completion: (CryptoPrice?) -> Void = {
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
            guard let result = try? JSONSerialization.jsonObject(with: data),
                let json = result as? [String: Any] else {
                    completion(nil)
                    return
            }
            guard let last = json["last"] as? Double,
                let high = json["high"] as? Double else {
                    completion(nil)
                    return
            }
            
            completion(CryptoPrice(last: last, high: high))
        }
    }

}


