//
//  APIBuilder.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation

public struct APIBuilder {
    let baseUrl: String
    let path: String
    let headers: [String: String]?
    let queryParams: [URLQueryItem]?
    let requestTimeOut: Float?
    let httpMethod: HTTPMethod

    public init(baseUrl: String,
                path: String,
                headers: [String: String]? = nil,
                queryParams: [URLQueryItem]? = nil,
                requestTimeOut: Float? = nil,
                httpMethod: HTTPMethod
    ) {
        self.baseUrl = baseUrl
        self.path = path
        self.headers = headers
        self.queryParams = queryParams
        self.requestTimeOut = requestTimeOut
        self.httpMethod = httpMethod
    }

    func buildURLRequest() -> URLRequest? {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            return nil
        }

        urlComponents.path += path

        if let queryParams = queryParams {
            urlComponents.queryItems = queryParams
        }

        guard let url = urlComponents.url else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]

        return urlRequest
    }
}



public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}
