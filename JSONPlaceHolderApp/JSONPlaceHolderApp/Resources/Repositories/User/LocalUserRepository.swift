//
//  LocalUserRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

class LocalUserRepository: APIBaseRepository, UserRepositoryProtocol {
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion(UsersManager.shared.getUsers())
    }
}
