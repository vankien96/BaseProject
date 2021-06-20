//
//  User.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 07/06/2021.
//

import Foundation

struct UserInfo: Codable {
    
    var id: String!
    var fullName: String = ""
    var gender: Int?
    var avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case gender
        case avatar
    }
}
