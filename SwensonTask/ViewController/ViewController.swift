//
//  ViewController.swift
//  SwensonTask
//
//  Created by Michael Adliy on 24/01/2021.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    var data = [Task(Id: 1 , Title: "Anagrams", SegueIdentifier: "AnagramsSegue") , Task(Id: 2 , Title: "Fibonacci", SegueIdentifier: "FibonacciSegue") , Task(Id: 3, Title: "Currency" ,SegueIdentifier:"CurrencySegue")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TaskTableViewCell.nib(), forCellReuseIdentifier: TaskTableViewCell.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.cellIdentifier, for: indexPath) as! TaskTableViewCell
        let model = data[indexPath.row]
        cell.configure(with: TaskCellViewModel(Id: model.Id, Title: model.Title))
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = data[indexPath.row]
        performSegue(withIdentifier: model.SegueIdentifier, sender: nil)
    }
}





