//
//  StatusTest.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class StatusTest: XCTestCase {

    func testStatus() throws {
        
        let status1 = Status.none
        XCTAssertNotNil(status1)
        let status2 = Status.home
        XCTAssertNotNil(status2)
        let status3 = Status.loadingView
        XCTAssertNotNil(status3)
        let status4 = Status.errorView(error: "Error View")
        XCTAssertNotNil(status4)
        
        XCTAssertNotEqual(status1, status2)
        XCTAssertNotEqual(status1, status3)
        XCTAssertNotEqual(status1, status4)
        XCTAssertNotEqual(status2, status3)
        XCTAssertNotEqual(status2, status4)
        XCTAssertNotEqual(status3, status4)
        
    }
}
