//
//  LoginViewModel.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 04/06/2021.
//

import UIKit

enum LoginState {
    case initial
    case requesting
    case loginSuccess
    case loginFailed(_ error: Error)
    
    static func isRequesting(state: LoginState) -> Bool {
        switch state {
        case .requesting:
            return true
        default:
            return false
        }
    }
}

protocol LoginViewModelType {
    var stateHandler: ((LoginState) -> Void)? { get set }
    func login(email: String, password: String) async
}

class LoginViewModel: LoginViewModelType {
    
    var stateHandler: ((LoginState) -> Void)?
    
    private let authUsecase: AuthUsecase
    private let emailValidation = EmailValidation()
    private let passwordValidation = PasswordValidation()
    
    init(authUsecase: AuthUsecase) {
        self.authUsecase = authUsecase
    }
    
    func login(email: String, password: String) async {
        guard self.isValidCredentials(email: email, password: password) else { return }
        stateHandler?(.requesting)
        let result = await self.authUsecase.loginWithCredentials(email: email, password: password)
        switch result {
        case .success(_):
            self.stateHandler?(.loginSuccess)
        case .failure(let error):
            self.stateHandler?(.loginFailed(error))
        }
    }
}

private extension LoginViewModel {
    
    func isValidCredentials(email: String, password: String) -> Bool {
        return isValidEmail(email: email)
    }
    
    func isValidEmail(email: String) -> Bool {
        let validateResult = emailValidation.validate(email)
        return isSuccess(validateResult: validateResult)
    }
    
    func isValidPassword(password: String) -> Bool {
        let validateResult = passwordValidation.validate(password)
        return isSuccess(validateResult: validateResult)
    }
    
    func isSuccess(validateResult: Result<Void, ValidationError>) -> Bool {
        switch validateResult {
        case .failure(let error):
            stateHandler?(.loginFailed(error))
            return false
        case .success:
            return true
        }
    }
}
