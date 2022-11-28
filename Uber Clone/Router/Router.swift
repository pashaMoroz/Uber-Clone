//
//  Router.swift
//  Uber Clone
//
//  Created by Admin on 28/11/2022.
//

import UIKit

protocol RouterProtocol {
    func initialLoginController()
    func showSignUpController()
    func popToLoginController()
}

struct Router: RouterProtocol {
    private let navigationController: RootNavigationController
    private let assemblyBuilder: AssemblyModuleBuilder
    
    init(navigationController: RootNavigationController, assemblyBuilder: AssemblyModuleBuilder) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialLoginController() {
        let mainViewController = assemblyBuilder.createLoginController(router: self)
        navigationController.viewControllers = [mainViewController]
    }
    
    func showSignUpController() {
        let favoriteViewController = assemblyBuilder.createSignUpController(router: self)
        navigationController.pushViewController(favoriteViewController, animated: true)
    }
    
    func popToLoginController() {
        navigationController.popToRootViewController(animated: true)
    }
}
