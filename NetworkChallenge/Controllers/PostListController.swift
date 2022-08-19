//
//  PostListController.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 16/08/22.
//

import Foundation
import UIKit

class PostListViewController: UITableViewController {
    
    private let vm = PostListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        Task {
//            await populatePosts()
            await WebService.createUser(name: "vab;ludaujd", email: "caladddbresinha@rato.com", password: "viniciusdecalabresa")
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Posts"
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.posts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            fatalError("PostCell is not defined!")
        }
        
        let post = vm.posts[indexPath.row]
        cell.configure(post)
        
        return cell
    }
    
    private func populatePosts() async {
       await vm.populatePosts(url: Constants.Urls.getAllPosts)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
        print(vm.posts)
    }
    
}
