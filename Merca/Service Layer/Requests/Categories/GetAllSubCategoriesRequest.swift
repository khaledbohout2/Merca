//
//  GetAllSubCategoriesRequest.swift
//  Merca
//
//  Created by Khaled Bohout on 11/07/2021.
//

import Foundation

final class GetAllSubCategoriesRequest: Requestable {
    
    typealias ResponseType = SubCategoryResponse
    
    private var id: Int!
    
    init(id: Int) {
        
        self.id = id
    }
    
    var baseUrl: URL {
        
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "8060/api/v1/lookups/sub-categories"
    }
    
    var method: Network.Method {
        return .get
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return ["mainCategoryId" : "\(self.id!)"]
    }
    
    var headers: [String : String]? {

        return defaultJSONHeader
    }
    
    var timeout: TimeInterval {
        return 30.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}
