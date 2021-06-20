//
//  PasswordValidation.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 14/06/2021.
//

import Foundation

class PasswordValidation: StringValidation {
    
    func validate(_ text: String) -> Result<Void, ValidationError> {
        if text.count < 6 {
            return .failure(ValidationError(errorMessage: "Password must be at least 6 character"))
        }
        return .success(())
    }
}
