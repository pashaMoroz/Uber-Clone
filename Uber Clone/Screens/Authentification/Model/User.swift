//
//  User.swift
//  Uber Clone
//
//  Created by Admin on 21/12/2022.
//

import Foundation

enum AccountType: Int {
    case rider
    case driver
    
    var typeUser: String {
        switch self {
        case .driver:
            return "driver"
            
        case .rider:
            return "rider"
        }
    }
}

struct User {
    
    let email: String
    let fullname: String
    let accountType: AccountType
    
}
