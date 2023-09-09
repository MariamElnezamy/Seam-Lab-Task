//
//  ViewController.swift
//  Seamlabs Task
//
//  Created by Mariam on 04/09/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        customTableView.reloadData()
    }


}

