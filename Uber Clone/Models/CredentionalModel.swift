//
//  CredentionalModel.swift
//  Uber Clone
//
//  Created by Admin on 16/12/2022.
//

import Foundation

struct Email: Equatable {
    let validateValue: String
    
    init?(_ rawString: String?) {
        guard let rawString = rawString else { return nil }
        guard rawString.isValidEmail() else { return nil }
        validateValue = rawString
    }
}

struct Password: Equatable {
    let validateValue: String
    
    init?(_ rawString: String?) {
        guard let rawString = rawString else { return nil }
        guard rawString.count >= 6 else { return nil }
        validateValue = rawString
    }
}
