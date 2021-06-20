//
//  MainCoordinator.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 14/06/2021.
//

import Foundation
import UIKit

// Temp coordinator, apply coordinator pattern later
class MainCoordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showLogin() {
        let viewController = LoginViewController()
        let viewModel = LoginViewModel(authUsecase: DependencyInjection.shared.resolve(AuthUsecase.self))
        viewController.bind(to: viewModel)
        setRoot(viewController: viewController)
    }
    
    func showMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()!
        setRoot(viewController: viewController)
    }
}

private extension MainCoordinator {
    func setRoot(viewController: UIViewController) {
        guard let window = self.window else { return }
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        window.backgroundColor = .white
        window.layer.add(transition, forKey: kCATransition)
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        })
    }
}

