//
//  Extension+UIViewController.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    static let hud = JGProgressHUD(style: .dark)
    
    func showLoader(_ show: Bool) {
        view.endEditing(true)
        
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
}

extension UIViewController {
    
    func showMessage(withTitle: String, message: String) {
        
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
