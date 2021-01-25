//
//  TaskTableViewCell.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    static let cellIdentifier = "TaskTableViewCell"
    
    @IBOutlet var taskTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TaskTableViewCell", bundle: nil)
    }
    
    
    public func configure(with viewModel: TaskCellViewModel) {
        taskTitleLabel.text = "\(viewModel.Title)"
    }
    
    
}
