//
//  Service.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation
import Combine

class HomeService: HomeServiceProtocol {
    
    private var networkRequest: APIServiceProtocol
    
    init(networkRequest: APIServiceProtocol = APIService()) {
        self.networkRequest = networkRequest
    }
    
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        let endpoint = ServiceEndpoints.getProduct
        let requestNetwork = endpoint.createRequest(request: HomeRequest(q: "tesla"), environment: .development, path: APIConstants.home.rawValue)
        return self.networkRequest.request(requestNetwork)
    }
}

