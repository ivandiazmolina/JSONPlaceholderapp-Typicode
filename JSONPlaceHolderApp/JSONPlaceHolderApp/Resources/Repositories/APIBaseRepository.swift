//
//  APIBaseRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

enum APIEndpoint {
    case posts
    case users
    case comments(postId: Int)
    
    var url: String {
        switch self {
        case .posts:
            return "/posts"
        case .users:
            return "/users"
        case .comments(let postId):
            return "/comments?postId=\(postId)"
        }
    }
}

class APIBaseRepository {
    
    // MARK: Common
    static internal let BASE_URL = "http://jsonplaceholder.typicode.com"
    
    
    /// create URL from an enum of APIEndPoint
    /// - Parameter endPoint: endpoint
    /// - Returns: URL object with the Endpoint from API
    static func createURL(endPoint: APIEndpoint) -> URL? {
        return URL(string: BASE_URL + endPoint.url)
    }
}
