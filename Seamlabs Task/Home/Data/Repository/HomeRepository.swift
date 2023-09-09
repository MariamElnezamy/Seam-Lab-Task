//
//  HomeRepository.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Combine

final class HomeRepository: DisposeObject, HomeRepositoryProtocol {
    
    // MARK: - PROPERTIES
    private let service: HomeServiceProtocol

    // MARK: - INIT
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
        super.init()
    }

    // MARK: - REPOSITORIES METHODS
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        return service.getHome()
    }
}
