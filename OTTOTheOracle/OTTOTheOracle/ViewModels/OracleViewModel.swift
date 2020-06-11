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

	private var mythicOracleModel = MythicOracleModel()
	private var gmaOracleModel = GMAOracleModel()

	private var oracleModel = OracleModel()

	private var currentMythicCard = MythicCard()
	private var currentGMACard = GMACard()


	// CRGE
	@Published var surgeFactor: Int = 5

	// RPG-Solo, Fate
	@Published var surpriseFactor: Int = 0

	@Published var advancedMythicCardViewModel = MythicCardViewModel(mythicCard: MythicCard())

	@Published var currentMythicCardViewModel = MythicCardViewModel(mythicCard: MythicCard())
	@Published var currentGMACardViewModel = GMACardViewModel(gmaCard: GMACard())

	@Published var diceSquareViewModel = DiceSquareViewModel()

	init() {
		os_log(.default, log: logger, "Creating OTTOOracleManager")
		// Set up API instance
	}

	// MARK: - Class Methods

	/**
	Draws a Mythic Card for the View Model
	*/
	func drawMythicCard() {
		guard let theMythicCard = mythicOracleModel.drawMythicCard() else { return }
		currentMythicCardViewModel = MythicCardViewModel(mythicCard: theMythicCard)
	}

	func drawMythicCardIndex(_ index: Int, forward: Bool = true) {
		if let indexedMythicCard = mythicOracleModel.drawMythicCardIndex(index, forward: forward) {
			currentMythicCardViewModel = MythicCardViewModel(mythicCard: indexedMythicCard)
		}
	}

	func drawGMACard() {
		guard let theGMACard = gmaOracleModel.drawACard() else { return }
		print("Got a GMA card")
		currentGMACardViewModel = GMACardViewModel(gmaCard: theGMACard)
		getNewDiceSquareRoll()
	}

	func drawGMACardAtIndex(_ index: Int) {
		guard let theGMACard = gmaOracleModel.drawGMACardByIndex(index) else { return }
		currentGMACardViewModel = GMACardViewModel(gmaCard: theGMACard)
	}

	func getNewDiceSquareRoll() {
		print("rerollling")
		diceSquareViewModel.getNewRolls()
	}

	func getMythicOracleResult(difficulty: MYTHIC_FATE_RANK, chaosFactor: Int) {
		print("Drawing advanced Mythic card")

		if let mythicOracleResultCard = mythicOracleModel.getMythicOracleResultFor(difficulty, atChaosFactor: chaosFactor) {
			currentMythicCardViewModel = MythicCardViewModel(mythicCard: mythicOracleResultCard)
		}
	}

}
