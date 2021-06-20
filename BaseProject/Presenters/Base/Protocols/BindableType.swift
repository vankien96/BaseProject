//
//  BindableType.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 04/06/2021.
//

import UIKit

protocol BindableType: AnyObject {
    associatedtype T
    
    var viewModel: T! { get set }
    
    func bindViewModel()
    
    func setupUI()
}

extension BindableType where Self: UIViewController {
    
    func bind(to model: Self.T) {
        viewModel = model
        setupUI()
        loadViewIfNeeded()
        bindViewModel()
    }
}
