//
//  HomeServiceTests.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 07/09/2023.
//

import XCTest
import Combine
@testable import Seamlabs_Task

final class HomeServiceTests: XCTestCase {
        
    private var sut: HomeService!
    private var expectationDesc: String!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        expectationDesc = "HomeService"
        cancellables = []
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        expectationDesc = nil
        super.tearDown()
    }
    
    func testSUT_GetHome_testValidResponse() {
        // Given
        let apiService = MockAPIService()
        apiService.fileName = "HomeServiceResponse"
        sut = HomeService(networkRequest: apiService)
        let expectation = expectation(description: expectationDesc)
        // When
        let publisher = sut.getHome()
        let cancellable = publisher
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                    expectation.fulfill()
                },
                receiveValue: {
                    XCTAssertNotNil($0)
                }
            )
        // Then
        waitForExpectations(timeout: 10)
        cancellable.cancel()
    }
    
    func testSUT_GetHome_testInvalidResponse() {
        // Given
        let apiService = MockAPIService()
        apiService.fileName = "HomeServiceResponse"
        sut = HomeService()
        let expectation = expectation(description: expectationDesc)
        // When
        let publisher = sut.getHome()
        let cancellable = publisher
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completion in
                    XCTAssertNotEqual(completion, .failure(.invalidJSON("")))
                    expectation.fulfill()
                },
                receiveValue: { _ in
                }
            )
        // Then
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
    }
    
}
