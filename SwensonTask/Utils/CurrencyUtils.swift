//
//  CurrencyUtils.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

class CurrencyUtils: NSObject {
    static func getCurrencyCode(countryCode : String) -> String {
        let countryCodeCA = countryCode
        let localeIdCA = NSLocale.localeIdentifier(fromComponents: [ NSLocale.Key.countryCode.rawValue : countryCodeCA])
        let localeCA = NSLocale(localeIdentifier: localeIdCA)
        let currencyCodeCA = localeCA.object(forKey: NSLocale.Key.currencyCode)
        return "\(currencyCodeCA!)"
    }
}
