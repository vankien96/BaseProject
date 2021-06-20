//
//  AuthUsecaseData.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 07/06/2021.
//

import Foundation

class AuthUsecaseData: AuthUsecase {
    
    var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func loginWithCredentials(email: String, password: String) async -> Result<UserInfo, Error> {
        return await userRepository.loginWithCredentials(email: email, password: password)
    }
}
