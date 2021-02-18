//
//  PostRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

protocol PostRepositoryProtocol {
    func getPosts(completion: @escaping([Post]) -> Void)
}

class PostRepository {
    
    private var apiRepository: PostRepositoryProtocol = APIPostRepository()
    private var localRepository: PostRepositoryProtocol = LocalPostRepository()
    private var cacheRepository: PostRepositoryProtocol = CachePostRepository()
    
    /// Method that requests the posts
    /// - Parameter completion: completion
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        
        // 1. try to get posts from Cache
        cacheRepository.getPosts { [weak self] (posts) in
            
            // 2. return the cache posts if it is not empty
            if !posts.isEmpty {
                completion(posts)
                return
            }
            
            // 3. try to get the local posts
            self?.localRepository.getPosts { [weak self] (posts) in
                
                // 4. return the local posts if it is not empty
                if !posts.isEmpty {
                    completion(posts)
                    return
                }
                
                // 5. try to get the remote posts
                self?.apiRepository.getPosts { (posts) in
                    
                    // 6. if it is not empty, save it in local
                    if !posts.isEmpty {
                        PostsManager.shared.setPosts(posts)
                    }
                                        
                    // 7. return the posts
                    completion(posts)
                }
            }
        }
    }
}
