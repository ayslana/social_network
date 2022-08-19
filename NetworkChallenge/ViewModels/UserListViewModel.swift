//
//  UserListViewModel.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 16/08/22.
//

import Foundation

class UserListViewModel {
    
    private(set) var users: [UserCellViewModel] = []
    
    func populateUsers(url: URL) async {
        do {
            let users = try await WebService().getUsers(url: url)
            self.users = users.map(UserCellViewModel.init)
        }
        catch {
            print(error)
        }
    }
    
}


struct UserCellViewModel {
    private let user: UserListModel
    
    init(user: UserListModel) {
        self.user = user
    }
    
    var id: String {
        user.id
    }
    
    var name: String {
        user.name
    }
    
    var email: String {
        user.email
    }

    
}
