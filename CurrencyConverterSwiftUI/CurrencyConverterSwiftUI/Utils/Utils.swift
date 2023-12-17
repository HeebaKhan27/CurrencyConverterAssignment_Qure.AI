//
//  Utils.swift
//  CurrencyConverterSwiftUI
//
//  Created by Heeba Khan on 16/12/23.
//

import Foundation

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue : Double {
        String.numberFormatter.decimalSeparator = "."
        if let result = String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            // to handle the input in european countried where ',' is same as '.'
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
    
}
