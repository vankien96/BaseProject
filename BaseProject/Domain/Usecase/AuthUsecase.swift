//
//  AuthenUsecase.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 04/06/2021.
//

import Foundation

protocol AuthUsecase {
    func loginWithCredentials(email: String, password: String) async -> Result<UserInfo, Error>
}
