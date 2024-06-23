//
//  HerosUseCaseTest.swift
//  Marvel_KCTests
//
//  Created by Jose Bueno Cruz on 21/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Marvel_KC

final class HerosUseCaseTest: XCTestCase {

    private var sut: HerosUseCase!
    private var herosEntry: HerosEntry!
    private var heroes: [Hero]!
    
    override func setUpWithError() throws {
        sut = HerosUseCase(repository: HerosRepository(network: NetworkHerosFake()))
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        herosEntry = nil
        heroes = nil
    }
    
    func testGetHeroes() async throws {
        //When
        let expectation = XCTestExpectation(description: "Get Heros")
        (herosEntry, heroes) = try await sut.getHeros()
        XCTAssertNotNil(herosEntry)
        XCTAssertNotNil(heroes)
        
        //Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(heroes.count, 2)
        XCTAssertEqual(heroes.first?.name, "Hulk")
    }
}
