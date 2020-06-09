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
		os_log(.default, log: logger, "Creating Fate Die")
		super.init(maxPips: 1)
		self.minPips = -1
	}
}


class FateDice {

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "FateDie"
	private static let logger = OSLog(subsystem: subsystem, category: catagory)

	static var fateDie1 = FateDie()
	static var fateDie2 = FateDie()
	static var fateDie3 = FateDie()
	static var fateDie4 = FateDie()

	static func roll() -> Int {
		os_log(.default, log: logger, "Performing FateDice roll.")
		let result1 = FateDice.fateDie1.roll()
		let result2 = FateDice.fateDie2.roll()
		let result3 = FateDice.fateDie3.roll()
		let result4 = FateDice.fateDie4.roll()

		return result1 + result2 + result3 + result4

	}
}
