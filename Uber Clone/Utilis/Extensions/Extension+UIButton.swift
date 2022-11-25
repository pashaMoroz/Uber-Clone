//
//  UIButton.swift
//  Uber Clone
//
//  Created by Admin on 25/11/2022.
//

import UIKit

extension UIButton {
    func attributedTitle(firstPart: String, secondPart: String) {
        
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 13)]
        
        let attriburedTitle = NSMutableAttributedString(string: "\(firstPart) ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.mainBlueTint, .font: UIFont.boldSystemFont(ofSize: 13)]
        
        attriburedTitle.append(NSAttributedString(string: secondPart, attributes: boldAtts))
        
        setAttributedTitle(attriburedTitle, for: .normal)
    }
}
