//
//  APIBaseRepository.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 15/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import Foundation

// Enum to know operation result.
//
// - success: Operation finish without error
// - failure: Operation finish with error
enum APIRequestResult<T> {
    case success(result: T)
    case failure(error: String)
}


enum APIEndpoint {
    case posts
//    case characters(serieID: Int)
//    case details(characterID: Int)
    
    
    var url: String {
        switch self {
        case .posts:
            return "/posts"
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
