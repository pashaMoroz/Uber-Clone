//
//  AuthService.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    func registrationUser(email: Email, password: Password)
    func authorization(email: Email, password: Password)
}

class AuthService: AuthServiceProtocol {
    
    func registrationUser(email: Email, password: Password) {
        
        print(email.string)
        print(password.string)
        //Auth.auth().createUser(withEmail: email.string, password: password.string)
    }
    
    func authorization(email: Email, password: Password) {
        print(email.string)
        print(password.string)
    }
}
