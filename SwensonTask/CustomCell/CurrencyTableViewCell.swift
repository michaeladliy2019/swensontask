//
//  CurrencyTableViewCell.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell , UITextFieldDelegate{

    static let cellIdentifier = "CurrencyTableViewCell"
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var currencyValueTextField: UITextField!
    @IBOutlet weak var currencyFlageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CurrencyTableViewCell", bundle: nil)
    }
    
    
    public func configure(with viewModel: CurrencyCellViewModel , tag : Int) {
        currencyValueTextField.text = "\(viewModel.CurrencyValue)"
        countryNameLabel.text = "\(viewModel.CountryName)"
        currencyCodeLabel.text = "\(viewModel.CurrencyCode)"
        currencyFlageImageView.image = viewModel.Flag
        currencyValueTextField.tag = tag
    }
}
