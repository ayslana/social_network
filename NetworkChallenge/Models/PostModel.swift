//
//  Post.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 15/08/22.
//

import Foundation

struct PostListModel: Decodable {
    
    let id: String
    let content: String
    let user_id: String
    let created_at: String
    let updated_at: String
    
}
