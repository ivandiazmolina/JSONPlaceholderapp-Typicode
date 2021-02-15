//
//  LocalPostRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

class LocalPostRepository: PostRepositoryProtocol {
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        completion(PostsManager.shared.getPosts())
    }
}
