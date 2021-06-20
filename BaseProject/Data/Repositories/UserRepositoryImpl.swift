//
//  UserRepository.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 07/06/2021.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    
    func loginWithCredentials(email: String, password: String) async -> Result<UserInfo, Error> {
        Thread.sleep(forTimeInterval: TimeInterval(5))
        return .success(UserInfo(id: "1", fullName: "Truong Van Kien", gender: 1, avatar: ""))
    }
}
