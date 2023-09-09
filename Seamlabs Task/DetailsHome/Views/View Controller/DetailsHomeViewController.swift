//
//  DetailsHomeViewController.swift
//  Seamlabs Task
//
//  Created by Mariam on 06/09/2023.
//

import UIKit
import Kingfisher

class DetailsHomeViewController: UIViewController, UITextFieldDelegate {
    
    var article: Articles?
    @IBOutlet weak var titleArticle: UILabel!
    @IBOutlet weak var descriptionArticle: UILabel!
    @IBOutlet weak var contentArticle: UILabel!
    @IBOutlet weak var sourceArticle: UILabel!
    @IBOutlet weak var publishedAtArticle: UILabel!
    @IBOutlet weak var authorArticle: UILabel!
    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var rateTextField: UITextField!
    
    @IBAction func urlArticle(sender: AnyObject) {
        if let url = NSURL(string: article?.url ?? ""){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        var title = ""
        var message = ""
        let rateNumber: Int? = Int(rateTextField.text!) ?? 0
        if rateNumber ?? 0 < 6 {
            title = "Congratatulations!"
            message = "You have successfully rated the article."
        }else{
            title = "Ops"
            message = "please enter your rate between 1 to 5"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleUI()
    }
    
}
