//
//  DetailsHomeViewController+Properties.swift
//  Seamlabs Task
//
//  Created by Mariam on 07/09/2023.
//

import UIKit

extension DetailsHomeViewController {
    
    func handleUI(){
        imageArticle.kf.setImage(with: URL(string: article?.urlToImage ?? ""), placeholder: UIImage(systemName: "photo"))
        titleArticle.text = article?.title
        descriptionArticle.text = article?.description
        contentArticle.text = article?.content
        publishedAtArticle.text = article?.publishedAt
        authorArticle.text = article?.author
        sourceArticle.text = "source: \(article?.source?.name ?? "")"
        
        titleArticle.numberOfLines = 0
        rateTextField.keyboardType = .numberPad
        rateTextField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissMissKeyboard))
        view.addGestureRecognizer(tap)
        
        contentArticle.numberOfLines = countLines(of: contentArticle, maxHeight: 180)
        descriptionArticle.numberOfLines = countLines(of: descriptionArticle, maxHeight: 180)
    }
    
    
    @objc func dissMissKeyboard() {
        view.endEditing(true)
    }
    
    func countLines(of label: UILabel, maxHeight: CGFloat) -> Int {
        guard let labelText = label.text else { return 0 }
        let rect = CGSize(width: label.bounds.width, height: maxHeight)
        let labelSize = labelText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font!], context: nil)
        let lines = Int(ceil(CGFloat(labelSize.height) / label.font.lineHeight))
        return labelText.contains("\n") && lines == 1 ? lines + 1 : lines
    }
    
}
