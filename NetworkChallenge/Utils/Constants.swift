//
//  Urls.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 16/08/22.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static let BASE_URL = "http://adaspace.local/"
        
        static let getAllPosts = URL(string: "\(BASE_URL)/posts")!
        
        static let createPost = URL(string: "\(BASE_URL)/posts")!

        static let getAllUsers = URL(string: "\(BASE_URL)/users")!
        
        static let createUser = URL(string: "\(BASE_URL)/users")!

    }
}
