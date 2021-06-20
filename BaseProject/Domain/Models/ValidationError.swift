//
//  ValidationError.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 11/06/2021.
//

import Foundation

class ValidationError: NSObject, LocalizedError {
    
    var errorMessage: String
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    override var description: String {
        get {
            return self.errorMessage
        }
    }
    
    var errorDescription: String? {
        get {
            return self.description
        }
    }
}
