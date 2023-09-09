//
//  HomeViewController+Properties.swift
//  Seamlabs Task
//
//  Created by Mariam on 07/09/2023.
//

import UIKit
import Combine

extension HomeViewController {
    
    func bindViewModel(){
        viewModel.$homeModel.sink { [weak self] data in
            self?.articls = data ?? []
            self?.customTableView.reloadData()
        }.store(in: &cancellables)
    }
    
    func navigate(to screen: HomeNavigation) {
        switch screen {
        case .success:
            self.bindViewModel()
        case .error:
            let alert = UIAlertController(title: "Ops", message: "API Failed", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
