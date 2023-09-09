//
//  HomeRepositoryProtocol.swift
//  Seamlabs Task
//
//  Created by Mariam on 08/09/2023.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func getHome() -> AnyPublisher<HomeModel, NetworkError>
}
