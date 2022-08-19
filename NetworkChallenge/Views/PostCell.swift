//
//  PostCell.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 18/08/22.
//

import Foundation
import UIKit
import SwiftUI

class PostCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sideLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ post: PostCellViewModel) {
        
        titleLabel.text = post.content
        subTitleLabel.text = post.created_at
        sideLabel.text = post.updated_at
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(sideLabel)
        
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        subTitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        
        sideLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        sideLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}

struct PostCellRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let cell = PostCell(style: .default, reuseIdentifier: "PostCell")
        cell.configure(PostCellViewModel(post: PostListModel(id: "Teste", content: "Teste", user_id: "Teste", created_at: "Teste", updated_at: "Teste")))
        return cell
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCellRepresentable()
    }
}
