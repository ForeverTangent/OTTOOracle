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
class OracleViewModel: ObservableObject {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "OracleManager"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	private var oracleModel = OracleModel()

	private var currentMythicCard = MythicCard()
	private var currentGMACard = GMACard()

	// Mythic
	@Published var chaosFactor: Int = 5

	// CRGE
	@Published var surgeFactor: Int = 5

	// RPG-Solo, Fate
	@Published var surpriseFactor: Int = 0

	@Published var currentMythicCardViewModel = MythicCardViewModel(mythicCard: MythicCard())
	@Published var currentGMACardViewModel = GMACardViewModel(gmaCard: GMACard())

	@Published var fateDiceRoll: Int = 0


	init() {
		os_log(.default, log: logger, "Creating OTTOOracleManager")
		// Set up API instance
	}

	// MARK: - Class Methods

	func rollFateDice() {
		fateDiceRoll = FateDice().roll()
	}

	
	func drawMythicCard() {
		print("Drawing a Mythic card")
				guard
			let theMythicDeck = oracleModel.mythicDeck,
			var firstDrawnCard = theMythicDeck.draw(fromTimesShuffled: 1).first else {
				print("Returned")
				return
		}
		print("Got a Mythic card")
		firstDrawnCard.forward = Bool.random()
		print("Drew card: \(firstDrawnCard.cardFile)")
		currentMythicCard = firstDrawnCard
		currentMythicCardViewModel = MythicCardViewModel(mythicCard: currentMythicCard)
		rollFateDice()
	}

	func drawGMACard() {
		guard
			let theGMADeck = oracleModel.gmaDeck,
			let firstDrawnCard = theGMADeck.draw(fromTimesShuffled: 1).first else {
				return
		}
		print("Got a GMA card")
		print("Drew card: \(firstDrawnCard.cardFile)")
		currentGMACard = firstDrawnCard
		currentGMACardViewModel = GMACardViewModel(gmaCard: currentGMACard)
	}

	func drawMythicCardIndex(_ index: Int, forward: Bool = true) {
		guard
			let theMythicDeck = oracleModel.mythicDeck,
			index < theMythicDeck.cards.count else {
				return
		}
		currentMythicCard = theMythicDeck.cards[index]
		currentMythicCard.forward = forward
		currentMythicCardViewModel = MythicCardViewModel(mythicCard: currentMythicCard)
	}

	func drawGMACardIndex(_ index: Int) {
		guard
			let theGMADeck = oracleModel.gmaDeck,
			index < theGMADeck.cards.count else {
				return
		}
		currentGMACard = theGMADeck.cards[index]
		currentGMACardViewModel = GMACardViewModel(gmaCard: currentGMACard)
	}

}
