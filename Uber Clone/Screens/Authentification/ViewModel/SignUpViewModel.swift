//
//  AuthentificationViewModel.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation

protocol AuthAlertProtocol: AnyObject {
    func showAlert()
}

protocol SignUpViewModelProtocol {
    func signUp(email: String?, password: String?)
    func showLoginController()
}

class SignUpViewModel: SignUpViewModelProtocol {
    
    private let authService: AuthServiceProtocol
    private let router: RouterProtocol
    
    weak var delegate: AuthAlertProtocol?
    
    init(authService: AuthServiceProtocol, router: RouterProtocol) {
        self.authService = authService
        self.router = router
    }
    
    func signUp(email: String?, password: String?) {
        
        if let email = Email(email), let password = Password(password) {
            authService.registrationUser(email: email, password: password)
        } else {
            delegate?.showAlert()
        }
    }
    
    func showLoginController() {
        router.popToLoginController()
    }
}
