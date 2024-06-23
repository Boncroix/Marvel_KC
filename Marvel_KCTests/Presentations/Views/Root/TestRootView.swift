//
//  TestRootView.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class TestRootView: XCTestCase {

    func testRootView() throws {
        
        let viewModel = HerosViewModel(useCaseHeros: HerosUseCaseFake())
        
        let view = RootView().environmentObject(viewModel)
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        viewModel.status = .none
        let text = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(text)
        
        viewModel.status = .loadingView
        let loadingView = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(loadingView)
        
        viewModel.status = .home
        let home = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(home)
        
        viewModel.status = .errorView(error: "Test Error")
        let errorView = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(errorView)
    }
    
}
