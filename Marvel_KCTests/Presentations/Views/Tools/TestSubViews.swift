//
//  TestSubViews.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

 import XCTest
 import SwiftUI
 import ViewInspector
 @testable import Marvel_KC

final class BackgroundSubViewTests: XCTestCase {
    
    
    // MARK: - testBackgroundSubView
    func testBackgroundSubView() throws {
        
        let view = BackgroundSubView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let filter = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(filter)
    }
}



final class PlaceHolderImageTests: XCTestCase {
    
    // MARK: - testPlaceHolderImageTest
    func testPlaceHolderImage() throws {
        let view = PlaceHolderImage()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
    }
}
