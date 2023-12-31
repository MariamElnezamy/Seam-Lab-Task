//
//  HomeService.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation
import Combine

public class APIService: APIServiceProtocol {
    
    public var requestTimeOut: Float = 30
    
    public func request<T>(_ req: APIBuilder) -> AnyPublisher<T, NetworkError>
    where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
        
        guard let url = req.buildURLRequest() else {
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url"))
            )
        }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.invalidJSON(String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}
