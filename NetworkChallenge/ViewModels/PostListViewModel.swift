//
//  PostListViewModel.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 16/08/22.
//

import Foundation

class PostListViewModel {
    
    private(set) var posts: [PostCellViewModel] = []
    
    func populatePosts(url: URL) async {
        do {
            let posts = try await WebService().getPosts(url: url)
            self.posts = posts.map(PostCellViewModel.init)
        }
        catch {
            print(error)
        }
    }
    
}


struct PostCellViewModel {
    private let post: PostListModel
    
    init(post: PostListModel) {
        self.post = post
    }
    
    var id: String {
        post.id
    }
    
    var content: String {
        post.content
    }
    
    var user_id: String {
        post.user_id
    }
    
    var created_at: String {
        post.created_at
    }
    
    var updated_at: String {
        post.updated_at
    }

    
}
