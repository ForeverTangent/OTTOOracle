//
//  GMAOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

class GMAOracleModel {

	// MARK: - Propeties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "GMAOracleModel"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	private var gmaDeck: Deck<GMACard>?

	// MARK: - Init

	init() {
		os_log(.default, log: logger, "Creating GMAOracleModel.")
		self.gmaDeck = loadGMADeck()
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

	public func drawACard() -> GMACard? {
		return gmaDeck?.draw().first
	}

	/**
	Sorts the Deck and get a specific card at index.
	*/
	public func drawGMACardByIndex(_ index: Int) -> GMACard? {
		guard
			let theGMADeck = gmaDeck,
			index < theGMADeck.cards.count else {
				return nil
		}

		theGMADeck.sortDeck()
		return theGMADeck.cards[index]

	}


}
