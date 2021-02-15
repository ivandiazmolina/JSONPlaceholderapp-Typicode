//
//  Post.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

struct Post: Codable {
    var user: User?
    var id: Int?
    var title: String?
    var body: String?
    private var userId: Int?
    
    init() {
        user = User()
        id = -1
        title = ""
        body = ""
        userId = -1
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Post.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
    
    func getUserId() -> Int {
        return userId ?? -1
    }
    
    mutating func setUser(user: User) {
        self.user = user
    }
}
