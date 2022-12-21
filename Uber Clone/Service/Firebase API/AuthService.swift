//
//  AuthService.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthServiceProtocol {
    func registrationUser(withCredential credentials: AuthCredential?, completion: @escaping (Error?) -> Void)
    func authorizationUser(email: Email, password: Password, completion: @escaping (AuthDataResult?, Error?) -> Void)
}

struct AuthCredential {
    let email: String
    let password: String
    let fullname: String
    let accountType: AccountType
    
    init?(email: String?, password: String?, fullname: String?, accountType: AccountType?) {
        
        guard let email = Email(email),
              let password = Password(password),
              let fullname = fullname,
              let accountType = accountType  else { return nil }
        
        self.email = email.validateValue
        self.password = password.validateValue
        self.fullname = fullname
        self.accountType = accountType
    }
}

class AuthService: AuthServiceProtocol {
    
    func registrationUser(withCredential credential: AuthCredential?, completion: @escaping (Error?) -> Void) {
        
        guard let credential = credential else { return }
        
        Auth.auth().createUser(withEmail: credential.email, password: credential.password) { result, error in
            if let error = error {
                completion(error)
            }

            guard let uid = result?.user.uid else { return }

            let values = ["email": credential.email, "fullname": credential.fullname, "accountType": credential.accountType.typeUser]
            
            COLLECTION_USERS.document(uid).setData(values, completion: completion)
        }
    }
    
    func authorizationUser(email: Email, password: Password, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        
        let email = email.validateValue
        let password = password.validateValue
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}
