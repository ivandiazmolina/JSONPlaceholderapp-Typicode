//
//  Cache.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 17/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

class Cache {
    
    static let shared = Cache()
    
    func savePosts(data: Data, key: String) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let encoded = try? encoder.encode(data) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: key)
        }
    }
    
    func readPosts(key: String) -> [Post] {
        
        var posts: [Post] = []
        
        if let savedPost = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            
            if let dataPosts = try? decoder.decode(Data.self, from: savedPost),
               let arrayStringPosts = try? decoder.decode([String].self, from: dataPosts) {
                
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
