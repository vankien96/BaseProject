//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 04/06/2021.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var mainCoordinator: MainCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        mainCoordinator = MainCoordinator(window: window)
        mainCoordinator.showLogin()
        return true
    }
}
