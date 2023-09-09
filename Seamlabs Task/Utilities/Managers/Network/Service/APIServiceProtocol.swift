//
//  APIServiceProtocol.swift
//  Seamlabs Task
//
//  Created by Mariam on 07/09/2023.
//

import Combine
import Foundation

public protocol APIServiceProtocol {
    var requestTimeOut: Float { get }
    func request<T: Codable>(_ req: APIBuilder) -> AnyPublisher<T, NetworkError>
}
