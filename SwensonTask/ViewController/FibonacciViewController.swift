//
//  FibonacciViewController.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

class FibonacciViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet var numberTextField : UITextField!
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var recursiveSwitch : UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

    }
    
    
    
    
    @IBAction func fibonacciButtonAction(_ sender: Any) {
        let number = Int(numberTextField.text ?? "0")!
        var fab = 0
        if(recursiveSwitch.isOn) {
            fab = recursiveFib(number)
        }
        else {
            fab = iterativeFib(number)
        }
        resultLabel.text = "\(fab)"
    }
    
    func recursiveFib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1{
            return 1
        }
        
        return recursiveFib(n -   1) + recursiveFib(n - 2)
    }
    
    func iterativeFib(_ n: Int) -> Int {
        var a = 1
        var b = 1
        guard n > 1 else { return a }
        
        (2...n-1).forEach { _ in
            (a, b) = (a + b, a)
        }
        return a
    }
    
    
    @IBAction func textFieldValueChange(_ sender: Any) {
        resultLabel.text = ""
    }
    
    // MARK: - Text Field Delegares
    
    // maximum 2 digits and 98 value
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let newValue = textField.text! + string
        
        if(Int(newValue) ?? 1 > 92) {
            return false
        }
        let newLength = textField.text!.count + string.count - range.length
        return newLength <= 2
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
