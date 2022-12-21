//
//  AuthentificationViewModel.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation

protocol AuthAlertProtocol: AnyObject {
    func showMessage(withTitle: String, message: String)
    func showLoader(_ show: Bool)
}

protocol SignUpViewModelProtocol {
    func signUp(credential: AuthCredential?)
    func showLoginController()
}

class SignUpViewModel: SignUpViewModelProtocol {
    
    // MARK: - Properties
    
    private let authService: AuthServiceProtocol
    private let router: RouterProtocol
    
    weak var delegate: AuthAlertProtocol?
    
    init(authService: AuthServiceProtocol, router: RouterProtocol) {
        self.authService = authService
        self.router = router
    }
    
    
    // MARK: - Action
    
    func signUp(credential: AuthCredential?) {
        
        if credential == nil {

            delegate?.showMessage(withTitle: "Error", message: "Error in the data you specified")
            return
        }
        
        self.delegate?.showLoader(true)
        
        authService.registrationUser(withCredential: credential) { error in
            
            if let error = error {
                self.delegate?.showMessage(withTitle: "Error", message: error.localizedDescription)
                self.delegate?.showLoader(false)
            }
            // router.goToMainVC
        }
        self.delegate?.showLoader(false)
    }
    
    // MARK: - Navigation
    
    func showLoginController() {
        router.popToLoginController()
    }
}
