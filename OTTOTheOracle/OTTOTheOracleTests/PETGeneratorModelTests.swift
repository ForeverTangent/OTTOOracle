//
//  PETGeneratorModelTests.swift
//  OTTOTheOracleTests
//
//  Created by Stanley Rosenbaum on 7/17/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import XCTest
@testable import OTTO_The_Oracle

class PETGeneratorModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


	func testBuildPETCharacter() throws {
		let petGeneratorModel = PETGeneratorModel()
		petGeneratorModel.buildNewPETCharacter()

		print(petGeneratorModel.petCharacter)

	}


}
