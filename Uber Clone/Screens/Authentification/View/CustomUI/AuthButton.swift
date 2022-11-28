//
//  AuthButton.swift
//  Uber Clone
//
//  Created by Admin on 28/11/2022.
//

import UIKit

class AuthButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backgroundColor = .mainBlueTint
        layer.cornerRadius = 5
        setHeight(50)
    }
    
    convenience init(titleText: String = "") {
        self.init(frame: .zero)
        self.setTitle(titleText, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
