//
//  EmailValidation.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 11/06/2021.
//

import Foundation

class EmailValidation: StringValidation {
    
    func validate(_ text: String) -> Result<Void, ValidationError> {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", Constants.RegexString.emailRegex)
        let isEmail = emailPred.evaluate(with: text)
        if isEmail {
            return .success(())
        } else {
            return .failure(ValidationError(errorMessage: "Invalid email format"))
        }
    }
}
