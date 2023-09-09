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
        return APIBuilder(url: getURL(request: request, from: environment, path: path), headers: headers, httpMethod: httpMethod)
    }
    
    func getURL(request: HomeRequest, from environment: Environment, path: String) -> String {
        let baseUrl = environment.serviceBaseUrl
        switch self {
        case .getProduct:
            return "\(baseUrl + path)?q=\(request.q)&apiKey=\(Constants.key_API.rawValue)"
        }
    }
}
