//
//  TestHerosViewModel.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class HerosViewModelTest: XCTestCase {
    
    private var sut: HerosViewModel!
    
    override func setUpWithError() throws {
        sut = HerosViewModel(useCaseHeros: HerosUseCaseFake())
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHerosViewModel() async throws {
        // Given
        let expectation = XCTestExpectation(description: "Get Heros")
        
        // When
        XCTAssertNoThrow(sut.getHeros())
        XCTAssertEqual(sut.status, .loadingView)
        
        // Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(sut.status, .home)
        XCTAssertEqual(sut.heros.count, 2)
        XCTAssertEqual(sut.heros.first?.name, "Hulk")
        
    }
}
