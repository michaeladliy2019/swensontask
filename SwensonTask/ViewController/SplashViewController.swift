//
//  SplashViewController.swift
//  SwensonTask
//
//  Created by Michael Adliy on 25/01/2021.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var leftConstrain: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
            self.leftConstrain.constant = 500
            UIView.animate(withDuration: 2.5) {
                self.view.layoutIfNeeded()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.performSegue(withIdentifier: "homeSegue", sender: nil)
        }
    }
}
