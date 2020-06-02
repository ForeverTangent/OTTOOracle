//
//  OracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/30/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

/**
Helper class for managing the models.
*/
class OracleManager: ObservableObject {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "OracleManager"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	private var oracleKnowledge = OracleKnowledge()

	@Published var mythicChaosLevel: Int = 5
	@Published var currentMythicCard = MYTHICCard()
	@Published var currentGMACard = GMACard()

	init() {
		os_log(.default, log: logger, "Creating OTTOOracleManager")
		// Set up API instance
	}

	// MARK: - Class Methods

	func drawMythicCard() {

		print("DRawing a card")
				guard
			let theMythicDeck = oracleKnowledge.mythicDeck,
			var firstDrawnCard = theMythicDeck.draw(fromTimesShuffled: 1).first else {
				print("Returned")
				return
		}
		print("got a card")
		firstDrawnCard.forward = Bool.random()
		currentMythicCard = firstDrawnCard
	}

//	func drawGMACard() {
//		guard
//			let theGMADeck = oracleKnowledge.gmaDeck,
//			let firstDrawnCard = theGMADeck.draw(fromTimesShuffled: 1).first else {
//				return
//		}
//		currentGMACard = firstDrawnCard
//	}



}
