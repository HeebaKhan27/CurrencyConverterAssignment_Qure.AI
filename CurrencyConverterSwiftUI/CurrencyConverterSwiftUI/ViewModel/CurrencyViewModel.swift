//
//  CurrencyViewModel.swift
//  CurrencyConverterSwiftUI
//
//  Created by Heeba Khan on 16/12/23.
//

import Foundation

struct CurrencyViewModel {
    
    var currencyList = [String]()
    
    func makeApiRequest(showAll: Bool, currencies: [String] = ["USD", "EUR", "GBP"]){
        apiRequest(url: "http://api.exchangeratesapi.io/v1/latest?access_key=55b0ffb04a7684f9cb58cb0b14c3ba6b") { currency in
            var tempList = [String]()
            for _currency in currency.rates {
                if showAll {
                    tempList.append("\(_currency.key)")
                    //\(String(format: "%0.2f", _currency.value))")
                } else if currencies.contains(_currency.key) {
                    tempList.append("\(_currency.key)")
                    //\(String(format: "%0.2f", _currency.value))")
                }
                tempList.sort()
            }
            
     //       currencyList = tempList
            //   currencyRates = currency.rates
            // for curren in currencyRates {
            print (tempList)
        }
    }
}
