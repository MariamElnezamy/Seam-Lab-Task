//
//  Service.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Combine

protocol HomeServiceProtocol {
    func getProduct(request: HomeRequest) -> AnyPublisher<HomeModel, NetworkError>
}

class HomeService: HomeServiceProtocol {
    
    private var networkRequest: Requestable
    
    init(networkRequest: Requestable = NativeRequestable()) {
        self.networkRequest = networkRequest
    }

    func getProduct(request: HomeRequest) -> AnyPublisher<HomeModel, NetworkError> {
        let endpoint = ServiceEndpoints.getProduct
        let requestNetwork = endpoint.createRequest(request: request, environment: .development)
        return self.networkRequest.request(requestNetwork)
    }
  
}

public struct HomeRequest: Encodable {
    public let q: String
}

