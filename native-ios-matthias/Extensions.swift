//
//  Extensions.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 22/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import Foundation
import UIKit


// Source: stackoverflow
extension Double {
    func toCurrencyString() -> String {
        return String(format: "%.6f", self)
    }
}

extension Array {
    
    // Here we'll convert array to dictionary
    public func convertToDictionary<Key: Hashable>(by selected: (Element) -> Key) -> [Key: Element] {
        // empty collection literal requires explicit type
        var result = [Key:Element]()
        for value in self {
            result[selected(value)] = value
        }
        return result
    }
}

// Source: https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        //print(link)
        downloadedFrom(url: url, contentMode: mode)
    }
}
