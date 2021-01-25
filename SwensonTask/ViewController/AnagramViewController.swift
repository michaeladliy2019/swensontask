//
//  AnagramViewController.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

class AnagramViewController: UIViewController {
    
    @IBOutlet var firstWordTextField : UITextField!
    @IBOutlet var secondWordTextField : UITextField!
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var swiftSwitch : UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

    }
    
    
    
    
    @IBAction func anagramCheckButtonAction(_ sender: Any) {
        firstWordTextField.resignFirstResponder()
        secondWordTextField.resignFirstResponder()
        let firstWord = firstWordTextField.text!
        let secondWord = secondWordTextField.text!
        if(firstWord.trimmingCharacters(in: CharacterSet.whitespaces) == "" || secondWord.trimmingCharacters(in: CharacterSet.whitespaces) == "") {
            resultLabel.text =  "Please fill first and second word."
            resultLabel.textColor = .red
            return
        }
        var anagram = false
        if(swiftSwitch.isOn) {
            anagram = checkAnagramSwift(firstWord: firstWord, secondWord: secondWord)
        }
        else {
            anagram = checkAnagram(firstWord: firstWord, secondWord: secondWord)
        }
        
        if(anagram){
            resultLabel.text =  "Anagram"
            resultLabel.textColor = .green
        }
        else{
            resultLabel.text =  "Not anagram"
            resultLabel.textColor = .red
        }
    }
    
    func checkAnagramSwift(firstWord : String , secondWord: String) -> Bool {
        return firstWord.lowercased().sorted() == secondWord.lowercased().sorted()
    }
    
    func checkAnagram(firstWord : String , secondWord: String) -> Bool {
        var firstWordDictionary = [Character: Int]()
        var secondWordDictionary = [Character: Int]()
                
        for char in firstWord {
            if (firstWordDictionary[char] != nil) {
                firstWordDictionary[char] = firstWordDictionary[char]! + 1
            } else {
                firstWordDictionary[char] = 1
            }
        }
        
        for char in secondWord {
            if (secondWordDictionary[char] != nil) {
                secondWordDictionary[char] = secondWordDictionary[char]! + 1
            } else {
                secondWordDictionary[char] = 1
            }
        }
        
        if firstWordDictionary == secondWordDictionary {
            return true
        }
        return false
    }
    
    @IBAction func textFieldValueChange(_ sender: Any) {
        resultLabel.text = ""
    }
    
}
