//
//  SignUpController.swift
//  Uber Clone
//
//  Created by Admin on 28/11/2022.
//

import UIKit
import FirebaseAuth

class SignUpController: UIViewController {
    
    // MARK:  Properties
    
    let viewModel: SignUpViewModelProtocol
    
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
    
    private lazy var fullnameContainerView: UIView = {
        guard let image = UIImage(named: "ic_person_outline_white_2x") else { return UIView() }
        let view = UIView().inputContainerView(image: image, textFeild: fullnameTextFeild)
        view.setHeight(50)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        guard let image = UIImage(named: "ic_lock_outline_white_2x") else { return UIView() }
        let view = UIView().inputContainerView(image: image, textFeild: passwordTextFeild)
        view.setHeight(50)
        return view
    }()
    
    private lazy var accountTypeContainerView: UIView = {
        guard let image = UIImage(named: "ic_account_box_white_2x") else { return UIView() }
        let view = UIView().inputContainerView(image: image, segmentedControl: accountTypeSegmentedControl)
        view.setHeight(80)
        return view
    }()
    
    private let emailTextFeild: UITextField = {
        let tf = UITextField()
        return UITextField().textFeild(withPlaceholder: "Email",
                                       isSecureTextEntry: false)
    }()
    
    private let fullnameTextFeild: UITextField = {
        let tf = UITextField()
        return UITextField().textFeild(withPlaceholder: "Fullname",
                                       isSecureTextEntry: false)
    }()
    
    private let passwordTextFeild: UITextField = {
        let tf = UITextField()
        return UITextField().textFeild(withPlaceholder: "Password",
                                       isSecureTextEntry: false)
    }()
    
    private let accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider", "Driver"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private lazy var signUpButton: AuthButton = {
        
        let button = AuthButton(titleText: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("SignUpController deinit")
    }
    
    
    // MARK:  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Action
    
    @objc func handleSignUp() {
        viewModel.signUp(email: emailTextFeild.text, password: passwordTextFeild.text)
    }
    
    @objc func handleShowLogin() {
        viewModel.showLoginController()
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, fullnameContainerView,
                                                   passwordContainerView, accountTypeContainerView, signUpButton])
        stack.axis = .vertical
        stack.spacing = 24
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
}

extension SignUpController: AuthAlertProtocol {
    func showAlert() {
        alert(message: "Email or password invalid")
    }
}
