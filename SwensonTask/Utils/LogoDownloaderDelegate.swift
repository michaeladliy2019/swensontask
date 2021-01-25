//
//  LogoDownloaderDelegate.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import Foundation

import UIKit

protocol LogoDownloaderDelegate {
    // Classes that adopt this protocol MUST define
    // this method -- and hopefully do something in
    // that definition.
    func didFinishDownloading(_ sender:Int)
}
