//
//  HomeTableViewCell.swift
//  Seamlabs Task
//
//  Created by Mariam on 04/09/2023.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var customImage: UIImageView!
    
    func config(articl: Articles){
        name.text = articl.title ?? "Default Title"
        name.numberOfLines = 0
        customImage.kf.setImage(with: URL(string: articl.urlToImage ?? ""), placeholder: UIImage(systemName: "photo"))
        customImage.contentMode = .scaleToFill
    }
   
}
