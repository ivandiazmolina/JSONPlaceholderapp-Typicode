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
    
    private var posts: [Post] = []
    
    func setPosts(_ posts: [Post]) {
        self.posts = posts
    }
    
    func getPosts() -> [Post] {
        return posts
    }
}
