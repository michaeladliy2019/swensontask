//
//  APIService.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "http://data.fixer.io/api/latest?access_key=2ba1c201b7874f3cd4ccfbaed02940c1&format=1")!
    
    func getCurrencyRates(completion : @escaping (CurrencyRate) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let result = try! jsonDecoder.decode(CurrencyRate.self, from: data)
                
                completion(result)
            }
            
        }.resume()
    }
}
