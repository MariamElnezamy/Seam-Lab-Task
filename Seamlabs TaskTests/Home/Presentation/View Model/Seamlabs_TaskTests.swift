//
//  Seamlabs_TaskTests.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 04/09/2023.
//

import XCTest
@testable import Seamlabs_Task

final class Seamlabs_TaskTests: XCTestCase {
    
    // MARK: - PROPERTIES
    private var sut: HomeViewModel!
    private var expectationDesc: String!

    // MARK: - LIFECYCLE
    override func setUp() {
        super.setUp()
        expectationDesc = "HomeViewModel"
        sut = HomeViewModel()
    }

    override func tearDown() {
        sut = nil
        expectationDesc = nil
        super.tearDown()
    }

 
    func testSUT_callingGetHome_recieved() {
        // Given
        let exp = expectation(description: expectationDesc)
        sut = ReceiptDetailsViewModel(transactionDetailsUseCase: MockFetchTransactionDetailsUseCase())

        // When
        sut.getHome()

        // Then
        XCTAssertNotNil(sut.homeModel)
    }

    func testSUT_callingGetHome_failed() {
        // Given
        let exp = expectation(description: expectationDesc)
        exp.assertForOverFulfill = false
        sut = makeTransactionDetailsSut(using: MockInValidReceiptDetailsService())

        // When
        sut.getHome()
        sut.$state
            .sink(receiveCompletion: { _ in
                exp.fulfill()
            }, receiveValue: {
                if $0 != .loading() {
                    exp.fulfill()
                }
            })
            .store(in: &sut.cancellables)

        waitForExpectations(timeout: 1)

        // Then
        XCTAssertEqual(sut.state, .failed(.init(code: 0, type: .business, message: MockData.generalErrorMsg)))
    }

}
