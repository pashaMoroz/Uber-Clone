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
        let view = LoginController()
        view.router = router
        
        return view
    }
    
    func createSignUpController(router: RouterProtocol) -> UIViewController {
        let authService = AuthService()
        let signUpViewModel = SignUpViewModel(authService: authService)
        
        let view = SignUpController(viewModel: signUpViewModel)
        
        view.viewModel.delegate = view
        view.router = router
        
        return view
    }
}
