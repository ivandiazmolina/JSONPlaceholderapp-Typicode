//
//  UserManager.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

class UsersManager {
    
    static let shared = UsersManager()
    
    private var users: [User] = []
    
    func setUsers(_ users: [User]) {
        self.users = users
    }
    
    func getUsers() -> [User] {
        return users
    }
}
