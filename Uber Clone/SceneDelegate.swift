//
//  SceneDelegate.swift
//  Uber Clone
//
//  Created by Admin on 22/11/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let viewController = LoginController()
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

