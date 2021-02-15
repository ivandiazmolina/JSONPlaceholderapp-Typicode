//
//  Comment.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    
    init() {
        postId = -1
        id = -1
        name = ""
        email = ""
        body = ""
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Comment.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
