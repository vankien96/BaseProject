//
//  UIViewController+Alert.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 11/06/2021.
//

import UIKit

protocol AlertDisplayer {
    
}

extension AlertDisplayer where Self: UIViewController {
    
    func showMessage(_ message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
