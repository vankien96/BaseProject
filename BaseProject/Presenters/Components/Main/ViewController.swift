//
//  ViewController.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 04/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapLogoutButton(_ sender: Any) {
        appDelegate.mainCoordinator.showLogin()
    }
}
