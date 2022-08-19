//
//  UserListController.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 16/08/22.
//

import Foundation
import UIKit

class UserListViewController: UITableViewController {
    
    private let vm = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await populateUsers()
        }
    }
    
    
    private func populateUsers() async {
       await vm.populateUsers(url: Constants.Urls.getAllUsers)
        print(vm.users)
    }
}
