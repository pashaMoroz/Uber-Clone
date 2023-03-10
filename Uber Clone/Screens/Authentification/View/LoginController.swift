//
//  LoginController.swift
//  Uber Clone
//
//  Created by Admin on 22/11/2022.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: LoginViewModelProtocol
    
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
    
    private let loginButton: AuthButton = {
        
        let button = AuthButton(titleText: "Log In")
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("LoginController deinit")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()        
    }
    
    // MARK: - Action
    
    @objc func handleLogIn() {
        viewModel.logInWithEmail(email: emailTextFeild.text, password: passwordTextFeild.text)
    }
    
    @objc func handleShowSignUp() {
        viewModel.showSignUpController()
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        configureNavigationBar()
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 24
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}

extension LoginController: AuthAlertProtocol {
    
}
