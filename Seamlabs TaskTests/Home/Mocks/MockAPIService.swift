//
//  MockAPIService.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 09/09/2023.
//

import Foundation
import Combine
@testable import Seamlabs_Task

class MockAPIService: APIServiceProtocol {
    var requestTimeOut: Float
    var fileName: String
    
    init(fileName: String = "", requestTimeOut: Float = 0.0) {
        self.fileName = fileName
        self.requestTimeOut = requestTimeOut
    }
    
    func request<T: Codable>(_ req: APIBuilder) -> AnyPublisher<T, NetworkError> {
        // get file path
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: fileName, ofType: "json") else {
            let response = HomeModel(status: "error", totalResults: 0, articles: nil)
            return Just(response as! T)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
        let fileURL = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: fileURL)
            let response = try JSONDecoder().decode(T.self, from: data)
            
            return Just(response)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        } catch {
            return Future<T, NetworkError> { error in
            }
            .eraseToAnyPublisher()
        }
    }
    
}
