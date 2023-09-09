//
//  MockHomeUseCase.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 07/09/2023.
//


@testable import Seamlabs_Task
import Combine

final class MockHomeUseCase: HomeUseCaseProtocol {
    
    // MARK: - EXECUTE USE CASE
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        Future<HomeModel, NetworkError> { promise in
            promise(.success(MockData.homeModel))
        }
        .eraseToAnyPublisher()
    }
}
