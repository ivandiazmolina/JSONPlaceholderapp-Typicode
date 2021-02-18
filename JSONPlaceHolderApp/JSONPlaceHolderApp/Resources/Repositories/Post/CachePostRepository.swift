//
//  CachePostRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 17/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

class CachePostRepository: PostRepositoryProtocol {
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        completion(Cache.shared.readPosts())
    }
}
