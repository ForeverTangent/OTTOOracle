//
//  FateDice.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

/**
Basic FateDice
*/
class FateDie: Die {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "FateDie"
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	// MARK: - Init

	init() {
//		os_log(.default, log: logger, "Creating Fate Die")
		super.init(maxPips: 1)
		self.minPips = -1
	}
}


class FateDieRoll {

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "FateDie"
	private static let logger = OSLog(subsystem: subsystem, category: catagory)

	var fateDie1 = FateDie()
	var fateDie2 = FateDie()
	var fateDie3 = FateDie()
	var fateDie4 = FateDie()

	func roll() -> Int {
//		os_log(.default, log: FateDice.logger, "Performing FateDice roll.")
		let result1 = fateDie1.roll()
		let result2 = fateDie2.roll()
		let result3 = fateDie3.roll()
		let result4 = fateDie4.roll()

		return result1 + result2 + result3 + result4
	}
}
