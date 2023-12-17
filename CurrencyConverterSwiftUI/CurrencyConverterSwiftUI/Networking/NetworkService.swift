//
//  NetworkService.swift
//  CurrencyConverterSwiftUI
//
//  Created by Heeba Khan on 16/12/23.
//

import Foundation
import Alamofire

struct NetworkService {
    
    func apiRequest(url: String, completion: @escaping (Currency) -> ()) {
        Session.default.request(url).responseDecodable(of: Currency.self) { response in
            
            switch response.result {
            case .success(let currencies):
                print(currencies)
                completion(currencies)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
