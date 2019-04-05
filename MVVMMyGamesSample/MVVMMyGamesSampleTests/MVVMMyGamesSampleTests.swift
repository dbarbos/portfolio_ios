//
//  MVVMMyGamesSampleTests.swift
//  MVVMMyGamesSampleTests
//
//  Created by Diler Barbosa on 05/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import XCTest
@testable import MVVMMyGamesSample

class MVVMMyGamesSampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameViewModelCantHaveMoreThan5Stars() {
        let game = Game(name: "Test Game", system: "test", rate: 7)
        let gameViewModel = GameViewModel(game: game)
        XCTAssertEqual(gameViewModel.rate, 5)
    }
    
    func testGameViewModelCantHaveLessThan0Stars() {
        let game = Game(name: "Test Game", system: "test", rate: -3)
        let gameViewModel = GameViewModel(game: game)
        XCTAssertEqual(gameViewModel.rate, 0)
    }

}
