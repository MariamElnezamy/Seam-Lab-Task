//
//  HomeUseCaseProtocol.swift
//  Seamlabs Task
//
//  Created by Mariam on 08/09/2023.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
    func getHome() -> AnyPublisher<HomeModel, NetworkError>
}
