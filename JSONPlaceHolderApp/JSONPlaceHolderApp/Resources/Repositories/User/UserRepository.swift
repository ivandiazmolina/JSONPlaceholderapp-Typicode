//
//  UserRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

protocol UserRepositoryProtocol {
    func getUsers(completion: @escaping([User]) -> Void)
}

class UserRepository {
  
    private var apiRepository: UserRepositoryProtocol = APIUserRepository()
    
    /// Method that requests the users
    /// - Parameter completion: completion
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        // 1. try to get the remote users
        apiRepository.getUsers { (users) in
            
            // 2. return the users
            completion(users)
        }
    }
}
