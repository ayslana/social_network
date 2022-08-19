//
//  User.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 16/08/22.
//

import Foundation

struct UserListModel: Codable {
    
    let id: String
    let name: String
    let email: String    
}

struct CreateUserModel: Codable {
    
    let name: String
    let email: String
    let password: String
    
}

struct CurrentUser: Codable {
    
    let token: String
    let user: UserListModel
    
}

