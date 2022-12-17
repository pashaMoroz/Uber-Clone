//
//  LoginViewModel.swift
//  Uber Clone
//
//  Created by Admin on 17/12/2022.
//

import Foundation

protocol LoginViewModelProtocol {
    func logInWithEmail(email: String?, password: String?)
    func showSignUpController()
}

class LoginViewModel: LoginViewModelProtocol {
    
    private let authService: AuthServiceProtocol
    private let router: RouterProtocol
    
    weak var delegate: AuthAlertProtocol?
    
    init(authService: AuthServiceProtocol, router: RouterProtocol) {
        self.authService = authService
        self.router = router
    }
    
    func logInWithEmail(email: String?, password: String?) {
        
        if let email = Email(email), let password = Password(password) {
            authService.authorization(email: email, password: password)
        } else {
            delegate?.showAlert()
        }
    }
    
    func showSignUpController() {
        router.showSignUpController()
    }
}
