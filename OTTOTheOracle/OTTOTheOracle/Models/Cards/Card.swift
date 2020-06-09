//
//  Card.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

/**
Card Class
*/
class Card {
	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "FateDie"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

}
