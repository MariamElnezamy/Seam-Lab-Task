//
//  MockHomeService.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 07/09/2023.
//

import Combine
import Foundation
@testable import Seamlabs_Task


final class MockValidHomeService: HomeServiceProtocol {

    // MARK: - SERVICE METHODS
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        let response = HomeModel(status: "ok", totalResults: 12240, articles: MockData.homeModel.articles)
        return Just(response)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}

final class MockInValidHomeService: HomeServiceProtocol {
    
    // MARK: - SERVICE METHODS
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        let response = HomeModel(status: "error", totalResults: 0, articles: nil)
        return Just(response)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
