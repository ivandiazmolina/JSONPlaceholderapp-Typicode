//
//  APIUserRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation
import IDIAZM

class APIUserRepository: APIBaseRepository, UserRepositoryProtocol {
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        // 1. try to init the URL
        guard let url = APIBaseRepository.createURL(endPoint: .users) else {
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
                        let users = try JSONDecoder().decode([User].self, from: data)
                        completion(users)
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
