//
//  AuthentificationViewModel.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation

protocol SignUpViewModelProtocol {
    func signUp(email: String?, password: String?)
    var  delegate: SignUpProtocol? { get set }
}

protocol SignUpProtocol {
    func showAlert()
}

struct SignUpViewModel: SignUpViewModelProtocol {
    
    let authService: AuthServiceProtocol
    
    var delegate: SignUpProtocol?
    
    func signUp(email: String?, password: String?) {
        
        if let email = Email(email), let password = Password(password) {
            authService.registrationUser(email: email, password: password)
        } else {
            delegate?.showAlert()
        }
    }
}
