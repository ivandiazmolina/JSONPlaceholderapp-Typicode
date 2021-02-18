//
//  PostTableViewCell.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    // MARK: LETS and VARS
    private var post: Post?
    
    static var cellIdentifier: String {
        return String(describing: PostTableViewCell.self)
    }
    
    // MARK: Methods
    
    /// method that updates UI
    /// - Parameter model: model with data
    func updateUI(model: Main.Models.PostCellModel) {
        
        post = model.post
        
        // Post
        postLabel.text = post?.title
        postLabel.textColor = .white
        postLabel.font = .boldSystemFont(ofSize: 16)
        
        // User
        userLabel.text = String(format:"%@ @%@", "posts.postedBy".localized, post?.user?.username ?? "-")
        userLabel.textColor = .lightGray
        userLabel.font = .boldSystemFont(ofSize: 12)
    }
}
