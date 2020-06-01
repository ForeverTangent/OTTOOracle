//
//  OTTOKnowledge.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

class OTTOKnowledge {

	// MARK: - Propeties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "OTTOOracle"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)


	var mythicDeck: Deck<MYTHICCard>?
	var gmaDeck: Deck<GMACard>?


	// MARK: - Init

	init() {
		os_log(.default, log: logger, "Creating OTTOKnowledge")
		mythicDeck = loadMYTHICDeck()
		gmaDeck = loadGMADeck()
	}


	// MARK: - Class Methods

	/**
	Loads the MYTHIC JSON data.
	- Returns: Deck<MYTHICCard>
	*/
	private func loadMYTHICDeck() -> Deck<MYTHICCard> {
		os_log(.default, log: logger, "loadMYTHICDeck()")
		let decoder = JSONDecoder()
		guard
			let path = Bundle.main.path(forResource:"MYTHIC_CARDS", ofType: "json"),
			let data = FileManager.default.contents(atPath: path),
			let mythicCards = try? decoder.decode([MYTHICCard].self, from: data) else {
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

}
