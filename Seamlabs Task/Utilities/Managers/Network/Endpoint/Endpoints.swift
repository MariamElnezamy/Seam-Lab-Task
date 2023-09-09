//
//  Endpoints.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation

public typealias Headers = [String: String]

enum ServiceEndpoints {
    
    case getProduct
    
    var requestTimeOut: Int {
        return 20
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getProduct:
            return .GET
        }
    }
    
    func createRequest(request: HomeRequest, environment: Environment, path: String) -> APIBuilder {
         var headers: Headers = [:]
         headers["Content-Type"] = "application/json"
         return APIBuilder(baseUrl: environment.serviceBaseUrl,
                           path: path,
                           headers: headers,
                           queryParams: [URLQueryItem(name: "q", value: request.q),
                                         URLQueryItem(name: "apiKey", value: Constants.key_API.rawValue)],
                           httpMethod: httpMethod)
     }
}
