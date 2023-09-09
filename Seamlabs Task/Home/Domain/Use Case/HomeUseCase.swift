//
//  HomeUseCase.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation
import Combine

final class HomeUseCase: DisposeObject, HomeUseCaseProtocol {
    // MARK: - PROPERTIES
    private let repository: HomeRepositoryProtocol

    // MARK: - INIT
    init(repository: HomeRepositoryProtocol = HomeRepository()) {
        self.repository = repository
    }

    // MARK: - EXECUTE USE CASE
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        return repository.getHome()
    }
}
