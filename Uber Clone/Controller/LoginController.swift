//
//  LoginController.swift
//  Uber Clone
//
//  Created by Admin on 22/11/2022.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        guard let image = UIImage(named: "ic_mail_outline_white_2x") else { return UIView() }
        let view = UIView().inputContainerView(image: image, textFeild: emailTextFeild)
        view.setHeight(50)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        guard let image = UIImage(named: "ic_lock_outline_white_2x") else { return UIView() }
        let view = UIView().inputContainerView(image: image, textFeild: passwordTextFeild)
        view.setHeight(50)
        return view
    }()

    private let emailTextFeild: UITextField = {
       let tf = UITextField()
        return UITextField().textFeild(withPlaceholder: "Email",
                                       isSecureTextEntry: false)
    }()
    
    private let passwordTextFeild: UITextField = {
       let tf = UITextField()
        return UITextField().textFeild(withPlaceholder: "Password",
                                       isSecureTextEntry: false)
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16, paddingRight: 16)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
