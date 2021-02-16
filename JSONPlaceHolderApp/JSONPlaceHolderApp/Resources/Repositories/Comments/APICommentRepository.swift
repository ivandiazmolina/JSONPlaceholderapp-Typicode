//
//  APICommentRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 16/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation
import IDIAZM

class APICommentRepository: APIBaseRepository, CommentRepositoryProtocol {
    
    func getComments(for post: Post, completion: @escaping ([Comment]) -> Void) {
        
        // 1. try to init the URL
        guard let url = APIBaseRepository.createURL(endPoint: .users) else {
            completion([])
            return
        }
        
        print("URL: \(url)")
        
        // 2. execute the request
        background {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                ui {
                    guard let data = data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let decodeComments = try JSONDecoder().decode([Comment].self, from: data)
                        completion(decodeComments)
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
