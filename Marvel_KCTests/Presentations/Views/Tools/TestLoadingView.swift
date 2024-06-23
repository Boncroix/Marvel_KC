//
//  TestLoadingView.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Marvel_KC

class LoadingViewTests: XCTestCase {
    
    func testLoadingView() throws {
        let view = LoadingView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let imageLoading = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(imageLoading)
        
        let viewLoading = view.loadingSubView
        
        let numItemsSub = try viewLoading.inspect().count
        XCTAssertEqual(numItemsSub, 1)
        
        let imageSub = try viewLoading.inspect().find(viewWithId: 2)
        XCTAssertNotNil(imageSub)
        
        let text = try viewLoading.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Loading...")
        
    }
        
}

