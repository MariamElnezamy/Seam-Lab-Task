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
        sut = HomeViewModel(useCase: MockHomeUseCase())
        // When
        sut.getHome()
        // Then
        XCTAssertNotNil(sut.$homeModel.count)
    }

}
