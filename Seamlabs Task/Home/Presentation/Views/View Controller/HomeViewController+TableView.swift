//
//  HomeViewController+TableView.swift
//  Seamlabs Task
//
//  Created by Mariam on 04/09/2023.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableViewDelegate(){
        customTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        customTableView.separatorStyle = .none
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeTableViewCell
        cell.config(articl: articls[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId) as! DetailsHomeViewController
        viewController.article = articls[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
