//
//  Cache.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 17/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

class Cache {
    
    private let KEY = "posts"
    
    static let shared = Cache()
    
    /// method saves posts in the mobile storage
    /// - Parameters:
    ///   - data: posts
    ///   - key: key to save posts
    func savePosts(data: Data) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let encoded = try? encoder.encode(data) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: KEY)
        }
    }
    
    /// method reads posts from mobile storage
    /// - Parameter key: key to retrieve posts
    /// - Returns: posts
    func readPosts() -> [Post] {
        
        var posts: [Post] = []
        
        // 1. try to get data with a specific key
        if let savedPost = UserDefaults.standard.object(forKey: KEY) as? Data {
            
            let decoder = JSONDecoder()
            
            // 2. try to decode data
            if let dataPosts = try? decoder.decode(Data.self, from: savedPost),
               let arrayStringPosts = try? decoder.decode([String].self, from: dataPosts) {
 
                // 3. convert every object in a Post
                for tmp in arrayStringPosts {
                    do {
                        let post = try Post(tmp)
                        posts.append(post)
                    } catch {}
                }
            }
        }
        
        return posts
    }
}
