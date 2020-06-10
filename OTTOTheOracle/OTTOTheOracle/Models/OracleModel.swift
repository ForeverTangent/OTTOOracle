//
//  OTTOKnowledge.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

/**
The Maaster Model
*/
class OracleModel {

	// MARK: - Propeties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "OracleKnowledge"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	private var mythicOracle = MythicOracleModel()

	var mythicDeck: Deck<MythicCard>?
	var gmaDeck: Deck<GMACard>?

	// MARK: - Init

	init() {
		os_log(.default, log: logger, "Creating OTTOKnowledge... Loading Cards")
		mythicDeck = loadMYTHICDeck()
		gmaDeck = loadGMADeck()
	}


	// MARK: - Class Methods

	/**
	Loads the MYTHIC JSON data.
	- Returns: Deck<MYTHICCard>
	*/
	private func loadMYTHICDeck() -> Deck<MythicCard> {
		os_log(.default, log: logger, "loadMYTHICDeck()")
		let decoder = JSONDecoder()
		guard
			let path = Bundle.main.path(forResource:"MYTHIC_CARDS", ofType: "json"),
			let data = FileManager.default.contents(atPath: path),
			let mythicCards = try? decoder.decode([MythicCard].self, from: data) else {
				fatalError("Can not get MYTHICCard json data")
		}

		return Deck(mythicCards)
	}

	/**
	Loads the CMA JSON data.
	- Returns: Deck<GMACard>
	*/
	private func loadGMADeck() -> Deck<GMACard> {
		os_log(.default, log: logger, "loadGMADeck()")
		let decoder = JSONDecoder()
		guard
			let path = Bundle.main.path(forResource:"GMA_CARDS", ofType: "json"),
			let data = FileManager.default.contents(atPath: path),
			let gmaCards = try? decoder.decode([GMACard].self, from: data) else {
				fatalError("Can not get GMACard json data")
		}

		return Deck(gmaCards)
	}

	/**
	
	*/
	public func getMythicOracleResultFor(_ mythicFateRank: MYTHIC_FATE_RANK, atChaosFactor chaosFactor: Int = 0) -> Bool {
		if chaosFactor != 0 {
			mythicOracle.currentMythicChaosLevel = chaosFactor
		}
		let results = mythicOracle.getOracleResultFor(mythicFateRank: mythicFateRank)
		return results
	}

}
