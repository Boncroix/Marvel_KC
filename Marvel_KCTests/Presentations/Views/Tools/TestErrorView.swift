//
//  TestErrorView.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Marvel_KC

final class TestErrorView: XCTestCase {

    func testViewError() throws {
        var tap: String = ""
        
        let view = ErrorView(error: "Test Error View") {
            tap = "Push"
        }
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let linearGradient = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(linearGradient)
        
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Test Error View")
        
        let divider = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(divider)
        
        let button = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(button)
        
        try button.button().tap()
        XCTAssertEqual(tap, "Push")
        
    }
}
