//
//  HomeViewController+TableView.swift
//  Seamlabs Task
//
//  Created by Mariam on 04/09/2023.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! HomeTableViewCell
        cell.name.text = names[indexPath.row]
        cell.customImage.image = 
        return cell
    }
    
    
}
