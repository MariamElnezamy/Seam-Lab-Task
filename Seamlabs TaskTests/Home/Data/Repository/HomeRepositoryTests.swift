//
//  HomeRepositoryTests.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 07/09/2023.
//

import XCTest
@testable import Seamlabs_Task

final class HomeRepositoryTests: XCTestCase {

    private var expectationDesc: String!
    private var sut: HomeRepository!

    override func setUp() {
        super.setUp()
        expectationDesc = "HomeRepository"
        sut = HomeRepository(service: MockValidHomeService())
    }

    override func tearDown() {
        sut = nil
        expectationDesc = nil
        super.tearDown()
    }
    
    func testSUT_GetHome_TestValidResponse() {
        // Given
        let exp = expectation(description: expectationDesc)
        sut = HomeRepository(service: MockValidHomeService())
        // When
        let cancellable = sut.getHome()
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
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
    }

    func testSUT_GetHome_testInValidResponse() {
        // Given
        let exp = expectation(description: expectationDesc)
        sut = HomeRepository(service: MockInValidHomeService())

        // When
        
        let cancellable = sut.getHome()
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completion in
                    XCTAssertNotEqual(completion, .finished)
                    expectation.fulfill()
                },
                receiveValue: { _ in
                }
            )

        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
    }

}
