//
//  OracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/30/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

class OTTOOracle: ObservableObject {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "OTTOOracle"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	static let shared = OTTOOracle()

	let ottoKnowledge = OTTOKnowledge()
	let ottoThinking = OTTOThinking()

	@Published var currentMythicCard: MYTHICCard?
	@Published var currentGMACard: GMACard?

	private init() {
		os_log(.default, log: logger, "Creating OTTOTheOracle's Brain")
		// Set up API instance
	}

	func getGMACard() {
		os_log(.default, log: logger, "Getting a GMACard")
		guard
			let theGMADeck = ottoKnowledge.gmaDeck,
			let theFirstCard = theGMADeck.draw().first else {
				currentGMACard = nil
				return
		}
		currentGMACard = theFirstCard
	}

	func getMYTHICCard() {
		os_log(.default, log: logger, "Getting a MYTHICCArd")
		guard
			let theMYTHICDeck = ottoKnowledge.mythicDeck,
			let theFirstCard = theMYTHICDeck.draw().first else {
				currentMythicCard = nil
				return
		}
		currentMythicCard = theFirstCard
	}

}
