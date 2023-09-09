//
//  MockHomeRepositry.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 08/09/2023.
//

import Foundation
import Combine
@testable import Seamlabs_Task

// MARK: - MockHomeRepositry
class MockHomeRepositry: HomeRepositoryProtocol {
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        return Just(MockData.homeModel)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
