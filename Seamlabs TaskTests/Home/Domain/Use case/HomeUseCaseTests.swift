//
//  HomeUseCaseTests.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 08/09/2023.
//

import XCTest
import Combine
@testable import Seamlabs_Task

final class HomeUseCaseTests: XCTestCase {

    private var sut: HomeUseCase!
    private var expectationDesc: String!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        sut = HomeUseCase(repository: MockHomeRepositry())
        expectationDesc = "HomeUseCase"
        cancellables = []
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        expectationDesc = nil
        super.tearDown()
    }

    func testSUT_whenLoadHome_testValidState() {
        // Given
        let exp = expectation(description: expectationDesc)
        // When
        sut.getHome()
            .receive(on: RunLoop.main)
            .sink { _ in
                exp.fulfill()
            } receiveValue: {
                XCTAssertNotNil($0)
            }
            .store(in: &cancellables)
        // Then
        waitForExpectations(timeout: 10)
    }

}
