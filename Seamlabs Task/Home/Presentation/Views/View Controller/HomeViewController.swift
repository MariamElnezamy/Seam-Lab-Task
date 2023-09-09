//
//  HomeViewController.swift
//  Seamlabs Task
//
//  Created by Mariam on 04/09/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    let cellId = "HomeTableViewCell"
    let storyboardId = "DetailsHomeView"
    var articls: [Articles] = []
    var cancellables: Set<AnyCancellable> = []
    let viewModel = HomeViewModel()
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Today News"
        tableViewDelegate()
        bindViewModel()
        viewModel.getHome()
    }
}

