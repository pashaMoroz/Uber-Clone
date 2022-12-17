//
//  CredentionalModel.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation

struct Email {
    let string: String
    
    init?(_ rawString: String?) {
        guard let rawString = rawString else { return nil }
        guard rawString.isValidEmail() else { return nil }
        string = rawString
    }
}

struct Password {
    let string: String
    
    init?(_ rawString: String?) {
        guard let rawString = rawString else { return nil }
        guard rawString.count >= 6 else { return nil }
        string = rawString
    }
}
