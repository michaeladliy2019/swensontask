//
//  CurrencyRate.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import Foundation


struct CurrencyRate : Decodable {
    let success : Bool
    let timestamp : Int
    let base : String
    let date : String
    let rates : Dictionary<String, Float>
}
