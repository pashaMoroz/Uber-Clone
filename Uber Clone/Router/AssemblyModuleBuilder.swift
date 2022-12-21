//
//  AssemblyModuleBuilder.swift
//  Uber Clone
//
//  Created by Admin on 28/11/2022.
//

import UIKit

protocol AssemblyModuleBuilder {
    func createLoginController(router: RouterProtocol) -> UIViewController
    func createSignUpController(router: RouterProtocol) -> UIViewController
}

struct AssemblyModuleBuilderImplementation: AssemblyModuleBuilder {
    func createLoginController(router: RouterProtocol) -> UIViewController {
        
        let authService = AuthService()
        let loginViewModel = LoginViewModel(authService: authService, router: router)
        let view = LoginController(viewModel: loginViewModel)
        loginViewModel.delegate = view
        
        return view
    }
    
    func createSignUpController(router: RouterProtocol) -> UIViewController {
        let authService = AuthService()
        let signUpViewModel = SignUpViewModel(authService: authService, router: router)
        let view = SignUpController(viewModel: signUpViewModel)
        signUpViewModel.delegate = view
        
        print("test")
        return view
    }
}
