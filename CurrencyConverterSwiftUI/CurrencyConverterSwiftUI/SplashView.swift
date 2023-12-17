//
//  SplashView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Heeba Khan on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var currencyList = [String]()
    @State var currencyRates = [Double]()
    
    
    func makeApiRequest(showAll: Bool){
        apiRequest(url: "http://api.exchangeratesapi.io/v1/latest?access_key=55b0ffb04a7684f9cb58cb0b14c3ba6b") { currency in
            var tempList = [String]()
            var tempRates = [Double]()
            var sortedData = currency.rates.sorted(by: <)
            
            for _currency in sortedData {
                if showAll {
                    tempList.append("\(_currency.key)")
                    //\(String(format: "%0.2f", _currency.value))")
                    tempRates.append(_currency.value)
                }
                
            }
            
            currencyList = tempList
            currencyRates = tempRates
        }
    }
    var body: some View {
        NavigationView {
            NavigationLink(destination: CurrencyView(currencyList: currencyList, currencyRates: currencyRates)){
                Text("long press to Convert Now")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .padding(50)
                    .background(
                        Image("bgImg")
                            .scaledToFill()
                    ).onTapGesture {
                        makeApiRequest(showAll: true )
                        
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
