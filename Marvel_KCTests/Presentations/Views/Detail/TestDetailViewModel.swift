//
//  TestDetailViewModel.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class SeriesViewModelTest: XCTestCase {
    
    private var sut: DetailViewModel!
    
    override func setUpWithError() throws {
        sut = DetailViewModel(useCaseSeries: SeriesUseCaseFake())
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSeriesViewModel() async throws {
        // Given
        let expectation = XCTestExpectation(description: "Get Series")
        
        // When
        XCTAssertNoThrow(sut.getSeries(hero: character1))
        XCTAssertEqual(sut.status, .loadingView)
        
        // Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(sut.status, .home)
        XCTAssertEqual(sut.series.count, 2)
        XCTAssertEqual(sut.series.first?.title, "Spider-Man Unlimited Infinity Comic (2023 - Present)")
    }
}
