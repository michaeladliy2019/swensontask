//
//  CurrencyViewController.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

import SKCountryPicker



class CurrencyViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {
    
    var data = [Currency]()
    var currencyRate : CurrencyRate!
    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var numberOfConvertersTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

        // call api to get all currency rate
        let apiService = APIService()
        apiService.getCurrencyRates { (CurrencyRate) in
            self.currencyRate = CurrencyRate
        }
        
        let numberOfrows = Int(numberOfConvertersTextField.text!)
        generateList(n: numberOfrows!)
        tableView.register(CurrencyTableViewCell.nib(), forCellReuseIdentifier: CurrencyTableViewCell.cellIdentifier)
    }
    
    // generate default array for number of converters
    func generateList(n:Int) {
        self.data = [Currency]()
        if(n > 0) {
            let usa = CountryManager.shared.country(withName: "United States")
            var currency = Currency(Id: 0, CurrencyValue: 1.0, CurrencyCode: "USD", CountryName: usa!.countryName, CountryCode: usa!.countryCode, Flag: usa!.flag)
            for i in 0...n - 1 {
                currency.Id = i
                self.data.append(currency)
            }
        }
        self.tableView.reloadData()
    }
    
    @IBAction func changeNumberOfRows(_ sender: Any) {
        let numberOfrows = Int(numberOfConvertersTextField.text!) ?? 0
        generateList(n: numberOfrows)
    }
    
    // MARK: - update modeles with new values while writing new value
    func updateModels(model : Currency) {
        for i in 0...data.count - 1 {
            if(model.Id != data[i].Id) {
                let valueCompareToEuro = currencyRate.rates[self.data[i].CurrencyCode]!
                let compareSelected = currencyRate.rates[model.CurrencyCode]!
                self.data[i].CurrencyValue = (valueCompareToEuro / compareSelected) * Float(model.CurrencyValue)
            }
        }
    }
    
    // MARK: - Text Field Delegares
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(textField.tag == -1 ) {
            let matchResult = RegularExpresion.validate(for: Constants.numberRegularExpresion, in: "\(textField.text!)\(string)")
            if(!matchResult) {
                return false
            }
            let newLength = textField.text!.count + string.count - range.length
            return newLength <= 2
        }
        else {
            if(string != "") {
                let matchResult = RegularExpresion.validate(for: Constants.decimalRegularExpresion, in: string)
                if(!matchResult) {
                    return false
                }
            }
            data[textField.tag].CurrencyValue = Float("\(textField.text!)\(string)")!
            let model = data[textField.tag]
            updateModels(model: model)
            return true
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        tableView.reloadData()
        return true
    }
    
    // MARK: - TableView Delegares
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.cellIdentifier, for: indexPath) as! CurrencyTableViewCell
        let model = data[indexPath.row]
        cell.configure(with: CurrencyCellViewModel(CurrencyValue: model.CurrencyValue, CurrencyCode: model.CurrencyCode, CountryName: model.CountryName, Flag: model.Flag) , tag: indexPath.row)
        cell.currencyValueTextField.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let countryController = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
            guard let self = self else { return }
            
            let currencycode = CurrencyUtils.getCurrencyCode(countryCode: country.countryCode)
            
            self.data[indexPath.row] = Currency(Id: self.data[indexPath.row].Id, CurrencyValue: 1.0, CurrencyCode: currencycode, CountryName: country.countryName, CountryCode: country.countryCode, Flag: country.flag)
            // select model to compare with
            var model : Currency!
            if(indexPath.row != 0) {
                model = self.data[0]
            }
            else if(indexPath.row != 1) {
                model = self.data[1]
            }
            let valueCompareToEuro = self.currencyRate.rates[self.data[indexPath.row].CurrencyCode]!
            let compareSelected = self.currencyRate.rates[model.CurrencyCode]!
            let CurrencyValue = (valueCompareToEuro / compareSelected) * Float(model.CurrencyValue)
            self.data[indexPath.row].CurrencyValue = CurrencyValue
            self.tableView.reloadData()
        }
        countryController.flagStyle = .corner
        countryController.isCountryDialHidden = true
    }
}
