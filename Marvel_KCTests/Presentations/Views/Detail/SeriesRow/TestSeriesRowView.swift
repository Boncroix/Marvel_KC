//
//  TestSeriesRowView.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class TestSeriesRowView: XCTestCase {
    
    func testSeriesRowViewTest() throws {
        
        let view = SeriesRowView(serie: serie1)
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let linearGradient = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(linearGradient)
        
        let text = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, serie1.title)
    }
}
