//
//  RegularExpresion.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import Foundation

class RegularExpresion: NSObject {
    static func validate(for regex: String, in text: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            let result = results.map {
                String(text[Range($0.range, in: text)!])
            }

            if(result.count == 0) {
                return false
            }
            else {
                return true
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return false
        }
    }
}
