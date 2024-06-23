//
//  SeriesUseCaseTest.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class SeriesUseCaseTest: XCTestCase {

    private var sut: SeriesUseCase!
    private var seriesEntry: SeriesEntry!
    private var series: [Serie]!
    
    override func setUpWithError() throws {
        sut = SeriesUseCase(repository: SeriesRepository(network: NetworkSeriesFake()))
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        seriesEntry = nil
        series = nil
    }
    
    func testGetSeries() async throws {
        //When
        let expectation = XCTestExpectation(description: "Get Series")
        (seriesEntry, series) = try await sut.getSeries(hero: character1)
        XCTAssertNotNil(seriesEntry)
        XCTAssertNotNil(series)
        
        //Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(series.count, 2)
        XCTAssertEqual(series.last?.title, "Jackpot (2024)")
    }
    
}
