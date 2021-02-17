//
//  PostsManager.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

class PostsManager {
    
    static let shared = PostsManager()
    
    var posts: [Post] = []
    private var postSelected: Post?
    
    func setPosts(_ posts: [Post]) {
        self.posts = posts
    }
    
    func getPosts() -> [Post] {
        return posts
    }
    
    func setPostSelected(post: Post) {
        postSelected = post
    }
    
    func getPostSelected() -> Post? {
        return postSelected
    }
}
