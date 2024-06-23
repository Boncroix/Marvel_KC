//
//  TestHerosListView.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class TestHerosListView: XCTestCase {
    
    var viewModel = HerosViewModel(useCaseHeros: HerosUseCaseFake())
    
    func testHerosListView() throws {
        let view = HerosListView().environmentObject(viewModel)
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let heroRow = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(heroRow)
    }
}
