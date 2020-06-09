//
//  Die.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

/**
A basic dice class.
*/
class Die {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "Die"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	internal var minPips: Int = 1
	private var maxPips: Int

	// MARK: - Init

	init(maxPips: Int) {
		os_log(.default, log: logger, "Creating Die with %d pips.", maxPips)
		self.maxPips = maxPips
	}

	// MARK: Class Methods

	func roll() -> Int {
		os_log(.default, log: logger, "Rolling %d Die", maxPips)
		var SRNG = SystemRandomNumberGenerator()
		return Int.random(in: minPips...maxPips, using: &SRNG)
	}
}
