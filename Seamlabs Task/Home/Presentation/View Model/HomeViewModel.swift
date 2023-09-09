//
//  HomeViewModel.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation
import Combine

class HomeViewModel: DisposeObject {
    
    @Published var homeModel: [Articles]?
    private let useCase: HomeUseCaseProtocol
    var navigationSubject: PassthroughSubject<HomeNavigation, Never>

   
    init(useCase: HomeUseCaseProtocol = HomeUseCase()) {
        self.useCase = useCase
        self.navigationSubject = .init()
        super.init()
    }

    func getHome() {
        useCase.getHome()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion  in
                guard let self = self else { return }
                guard case let .failure(error) = completion else { return }
                self.navigationSubject.send(.error)
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.navigationSubject.send(.success)
                self.homeModel = data.articles
            }
            .store(in: &cancellables)
    }
    
}

enum HomeNavigation {
    case success
    case error
}
