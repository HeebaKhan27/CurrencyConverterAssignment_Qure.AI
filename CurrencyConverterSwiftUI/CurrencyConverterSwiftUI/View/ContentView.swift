//
//  ContentView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Heeba Khan on 16/12/23.
///base=\(baseCurrency)&amount\(amount)

import SwiftUI

struct CurrencyView: View {
    
    @State private var itemSelected1 = UserDefaults.standard.integer(forKey: "selectedBaseCurrency")
    //savedBaseCurrency ?? 0
    @State private var itemSelected2 = UserDefaults.standard.integer(forKey: "selectedTargetCurrency")
    @State private var amount: String = ""
    @State var currencyList = [String]()
    @State var currencyRates = [ Double]()
    
    
    
    var currencyViewModel = CurrencyViewModel()
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencyList[itemSelected1]
        let targetcurrency = currencyList[itemSelected2]
        
        print(selectedCurrency)
        conversion = amount * ((currencyRates[itemSelected2] ) / (currencyRates[itemSelected1] ))
        print("value is \(conversion)")
        return String(format: "%0.2f", conversion)
    }
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Convert Currency").bold()){
                    TextField("Enter an amount", text: $amount).keyboardType(.decimalPad)
                    
                    Picker(selection: $itemSelected1, label: Text("From")) {
                        ForEach(0 ..< currencyList.count) { index in
                            Text(self.currencyList[index]).tag(index)
                        }
                    }.onChange(of: itemSelected1, perform: { newValue in
                        UserDefaults.standard.set(newValue, forKey: "selectedBaseCurrency")
                    })
                    Button("Switch Currency") {
                        var temp = itemSelected1
                        itemSelected1 = itemSelected2
                        itemSelected2 = temp
                    }
                    Picker(selection: $itemSelected2, label: Text("To")) {
                        ForEach(0 ..< currencyList.count) { index in
                            Text(self.currencyList[index]).tag(index)
                        }
                    }.onChange(of: itemSelected2, perform: {newValue in
                        UserDefaults.standard.set(newValue, forKey: "selectedTargetCurrency")
                    })
                }
                Section(header: Text("Conversion")) {
                    Text("\(convert(amount)) \(currencyList[itemSelected2])")
                }
            }
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView( currencyList: [String]())
    }
}
