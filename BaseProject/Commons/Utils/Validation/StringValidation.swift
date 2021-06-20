//
//  StringValidation.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 11/06/2021.
//

import Foundation
import UIKit

protocol StringValidation {
    func validate(_ text: String) -> Result<Void, ValidationError>
}
