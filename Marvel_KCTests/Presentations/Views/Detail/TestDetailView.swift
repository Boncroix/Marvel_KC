//
//  TestDetailView.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class TestDetailView: XCTestCase {
    

    func testDetailView() async throws {
        let viewModel = DetailViewModel(useCaseSeries: SeriesUseCaseFake())
        XCTAssertNotNil(viewModel)
        let view = DetailView(hero: character1)
            .environmentObject(viewModel)
        XCTAssertNotNil(view)
        
        viewModel.status = .none
        let text = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Status none")
        
        viewModel.status = .loadingView
        let viewLoading = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(viewLoading)
        
        viewModel.status = .errorView(error: "Test Error")
        let text1 = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text1)
        
        viewModel.status = .home
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let text2 = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text2)
        
        let image = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(image)
        
        let text3 = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(text3)
        
        let expectation = XCTestExpectation(description: "Get Series")
        
        XCTAssertNoThrow(viewModel.getSeries(hero: character1))
        XCTAssertEqual(viewModel.status, .loadingView)
        
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)

        let serie = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(serie)
    }
}
