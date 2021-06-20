//
//  LoginViewController.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 04/06/2021.
//

import UIKit

class LoginViewController: UIViewController, BindableType, AlertDisplayer {
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel: LoginViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading(loading: false)
    }
    
    func setupUI() {
        
    }
    
    func bindViewModel() {
        viewModel.stateHandler = { [weak self] state in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showLoading(loading: LoginState.isRequesting(state: state))
                switch state {
                case .initial:
                    break
                case .requesting:
                    break
                case .loginSuccess:
                    break
                case .loginFailed(let error):
                    self.showMessage(error.localizedDescription)
                    break
                }
            }
        }
    }
    
    @IBAction private func didTapLoginButton(_ sender: Any) {
        login()
    }
    
    func login() {
        let email = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        detach {
            await self.viewModel.login(email: email, password: password)
            DispatchQueue.main.async {
                appDelegate.mainCoordinator.showMain()
            }
        }
    }
}

private extension LoginViewController {
    
    func showLoading(loading: Bool) {
        self.loginButton.isHidden = loading
        self.loadingIndicator.isHidden = !loading
        
        if loading {
            self.loadingIndicator.startAnimating()
        } else {
            self.loadingIndicator.stopAnimating()
        }
    }
}
