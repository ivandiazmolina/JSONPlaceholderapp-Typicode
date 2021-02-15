//
//  APIPostRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation
import IDIAZM

class APIPostRepository: APIBaseRepository, PostRepositoryProtocol {
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        // 1. try to init the URL
        guard let url = APIBaseRepository.createURL(endPoint: .posts) else {
            completion([])
            return
        }
        
        // 2. execute the request
        background {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                ui {
                    guard let data = data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let posts = try JSONDecoder().decode([Post].self, from: data)
                        completion(posts)
                        return
                    } catch {
                        completion([])
                        return
                    }
                }
            }.resume()
        }
    }
}
