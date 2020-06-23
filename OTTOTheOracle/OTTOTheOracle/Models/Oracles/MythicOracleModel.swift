//
//  MythicOracleAnswerResult.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/5/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os


class MythicOracleModel {

	// MARK: - Propeties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "MythicOracleModel"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	private var mythicDeck: Deck<MythicCard>?

	var currentMythicChaosLevel: Int = 5
	private let chaosFactorToDrawAdjustment: [Int: Int] = [
		1:-2,
		2:-2,
		3:-1,
		4:-1,
		5:0,
		6:1,
		7:1,
		8:2,
		9:2
	]


	// MARK: - Init

	init() {
		os_log(.default, log: logger, "Creating MythicOracleModel.")
		self.mythicDeck = loadMYTHICDeck()
	}


	// MARK: - Class Methods

	/**
	Loads the MYTHIC JSON data.
	- Returns: Deck<MYTHICCard>
	*/
	private func loadMYTHICDeck() -> Deck<MythicCard> {
		os_log(.default, log: logger, "Loading Mythic Cards()")
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
	Shuffles and draws a mythic card.
	- Parameter forwad: Bool
	- Returns: MythicCard?
	*/
	func drawMythicCard() -> MythicCard? {
		os_log(.default, log: logger, "Drawing a Mythic card")
				guard
			let theMythicDeck = mythicDeck,
			var firstDrawnCard = theMythicDeck.draw(fromTimesShuffled: 1).first else {
				os_log(.default, log: logger, "No Mythic card drawn")
				return nil
		}
		os_log(.default, log: logger, "Got a Mythic card")
		firstDrawnCard.forward = Bool.random()

		os_log(.default, log: logger, "Drew card: %s", firstDrawnCard.cardFile)
		return firstDrawnCard
	}

	/**
	Shuffles and draws a mythic card and set if the card is forward or reversed.
	- Parameter forwad: Bool
	- Returns: MythicCard?
	*/
	func drawMythicCardAndSetForward(_ forward: Bool) -> MythicCard? {
		os_log(.default, log: logger, "Drawing a Mythic card")
		guard
			let theMythicDeck = mythicDeck,
			var firstDrawnCard = theMythicDeck.draw(fromTimesShuffled: 1).first else {
				os_log(.default, log: logger, "No Mythic card drawn")
				return nil
		}
		os_log(.default, log: logger, "Got a Mythic card")
		firstDrawnCard.forward = forward

		os_log(.default, log: logger, "Drew card: %s", firstDrawnCard.cardFile)

		return firstDrawnCard

	}

	/**
	Sorts the Deck and get a specific card at index.
	*/
	public func drawMythicCardIndex(_ index: Int, forward: Bool = true) -> MythicCard? {
		guard
			let theMythicDeck = mythicDeck,
			index < theMythicDeck.cards.count else {
				return nil
		}

		theMythicDeck.sortDeck()
		return theMythicDeck.cards[index]
		
	}


	/**
	Gets the Mythic Card Result for a given rank AND chaos factor.
	- Parameter mythicFateRank: MYTHIC_FATE_RANK
	- Parameter chaosFactor: Int = 0
	- Returns: MythicCard?
	*/
	public func getMythicOracleResultFor(_ mythicFateRank: MYTHIC_FATE_RANK, atChaosFactor chaosFactor: Int = 0) -> MythicCard? {
		if chaosFactor != 0 {
			currentMythicChaosLevel = chaosFactor
		}
		let boolResult = getOracleResultFor(mythicFateRank: mythicFateRank)
		return drawMythicCardAndSetForward(boolResult)
	}


	/**
	Gets the Mythic Oracle Result for a given rank.
	- Parameter mythicFateRank: MYTHIC_FATE_RANK
	- Returns: MythicCard?
	*/
	private func getOracleResultFor(mythicFateRank: MYTHIC_FATE_RANK) -> Bool {
		guard let chaosDrawAdjustment = chaosFactorToDrawAdjustment[currentMythicChaosLevel] else { return true }

		let mythicFateRank = MYTHIC_FATE_RANK.getMythicRankStatsFor(mythicFateRank)

		os_log(.default, log: logger, "Mythic Rank : %s", mythicFateRank.title)
		os_log(.default, log: logger, "Rank draw: %d", mythicFateRank.draw)
		os_log(.default, log: logger, "Chaos adjsutment: %d", chaosDrawAdjustment)

		var numberOfCardsToDraw = mythicFateRank.draw + chaosDrawAdjustment
		numberOfCardsToDraw = numberOfCardsToDraw < 1 ? 1 : numberOfCardsToDraw

		os_log(.default, log: logger, "numberOfCardsToDraw: %d", numberOfCardsToDraw)

		if numberOfCardsToDraw > 1 {
			var theBools = [Bool]()
			for _ in 1...numberOfCardsToDraw {
				theBools.append(Bool.random())
			}

			print(theBools)

			if mythicFateRank.neededYes == .ALL {
				print("ALL YES")
				return getIfAllTrue(theBools)
			}

			print("ANY YES")
			return getIfAnyTrue(theBools)

		}

		return Bool.random()

	}

	/**
	Get if ANY in an array of Bools are true.
	- Parameter boolArray: [Bool]
	- Returns: Bool
	*/
	private func getIfAnyTrue(_ boolArray: [Bool]) -> Bool {
		let anyTrue = boolArray.reduce(false) { (result, bool) in
			return result || bool
		}
		return anyTrue
	}

	/**
	Get if ALL in an array of Bools are true.
	- Parameter boolArray: [Bool]
	- Returns: Bool
	*/
	private func getIfAllTrue(_ boolArray: [Bool]) -> Bool {
		let allTrue = boolArray.reduce(true) { (result, bool) in
			return result && bool
		}
		return allTrue
	}

}

enum MYTHIC_ORACLE_ANSWER: String, RPG_TABLE {
	typealias EnumerationType = MYTHIC_ORACLE_ANSWER

	static var MIN: Int = 1
	static var MAX: Int = 4

	case NO_EXCEPTIONAL
	case NO
	case YES
	case YES_EXCEPTIONAL
	case NONE

	var descriptionShort: String {
		get {
			return rawValue.getEnumFormmatted()
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> MYTHIC_ORACLE_ANSWER {
		switch value {
			case 1: return .NO_EXCEPTIONAL
			case 2: return .NO
			case 3: return .YES
			case 4: return .YES_EXCEPTIONAL
			default: return .NONE
		}
	}
}

struct MythicFateRankStat {
	var title: String
	var draw: Int
	var neededYes: MYTHIC_YES_DRAW

}

enum MYTHIC_YES_DRAW: String, RPG_TABLE {
	typealias EnumerationType = MYTHIC_YES_DRAW

	static var MIN: Int = 1
	static var MAX: Int = 2

	case ANY = "ANY"
	case ALL = "ALL"
	case NONE = "NONE"

	var descriptionShort: String {
		get {
			return rawValue.getEnumFormmatted()
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> MYTHIC_YES_DRAW {
		switch value {
			case 1: return .ANY
			case 2: return .ALL
			default: return .NONE
		}
	}

}

/**
This Enum is Int based so we can use it with a slider
*/
enum MYTHIC_FATE_RANK: Int, RPG_TABLE {
	typealias EnumerationType = MYTHIC_FATE_RANK

	static var MIN: Int = 1
	static var MAX: Int = 11


	case REALLY_REALLY_HAS_TO_BE = 1
	case REALLY_HAS_TO_BE = 2
	case HAS_TO_BE = 3
	case VERY_LIKELY = 4
	case LIKELY = 5
	case FIFTY_FIFTY = 6
	case UNLIKELY = 7
	case VERY_UNLIKELY = 8
	case IMPOSSIBLE = 9
	case REALLY_IMPOSSIBLE = 10
	case REALLY_REALLY_IMPOSSIBLE = 11
	case NONE

	var descriptionShort: String {
		get {
			switch self {
				case .REALLY_REALLY_HAS_TO_BE: return "Really, Really, has to be..."
				case .REALLY_HAS_TO_BE: return " Really has to be..."
				case .HAS_TO_BE: return "Has to be..."
				case .VERY_LIKELY: return "Very Likely..."
				case .LIKELY: return "Likely..."
				case .FIFTY_FIFTY: return "Fifty Fifty..."
				case .UNLIKELY: return "Unlikely..."
				case .VERY_UNLIKELY: return "Very Unlikely..."
				case .IMPOSSIBLE: return "Impossible..."
				case .REALLY_IMPOSSIBLE: return "Really Impossible..."
				case .REALLY_REALLY_IMPOSSIBLE: return "Really, Really Impossible..."
				case .NONE: return "None"
			}
		}
	}

	var descriptionLong: String {
		return descriptionShort
	}

	static func getElementBy(value: Int) -> MYTHIC_FATE_RANK {
		switch value {
			case 1: return .REALLY_REALLY_HAS_TO_BE
			case 2: return .REALLY_HAS_TO_BE
			case 3: return .HAS_TO_BE
			case 4: return .VERY_LIKELY
			case 5: return .LIKELY
			case 6: return .FIFTY_FIFTY
			case 7: return .UNLIKELY
			case 8: return .VERY_UNLIKELY
			case 9: return .IMPOSSIBLE
			case 10: return .REALLY_IMPOSSIBLE
			case 11: return .REALLY_REALLY_IMPOSSIBLE
			default: return .NONE
		}
	}

	static func getMythicRankStatsFor(_ fateRank: MYTHIC_FATE_RANK) -> MythicFateRankStat {
		switch fateRank {
			case .REALLY_REALLY_HAS_TO_BE:
				return MythicFateRankStat(title: "Really, Really, Has to be",
										  draw: 6,
										  neededYes: .ANY)
			case .REALLY_HAS_TO_BE:
				return MythicFateRankStat(title: "Really, Has to be",
										  draw: 5,
										  neededYes: .ANY)
			case .HAS_TO_BE:
				return MythicFateRankStat(title: "Has to be",
										  draw: 4,
										  neededYes: .ANY)
			case .VERY_LIKELY:
				return MythicFateRankStat(title: "Very Likely",
										  draw: 3,
										  neededYes: .ANY)
			case .LIKELY:
				return MythicFateRankStat(title: "Likely",
										  draw: 2,
										  neededYes: .ANY)
			case .FIFTY_FIFTY:
				return MythicFateRankStat(title: "50/50",
										  draw: 1,
										  neededYes: .ANY)
			case .UNLIKELY:
				return MythicFateRankStat(title: "Unlikely",
										  draw: 2,
										  neededYes: .ALL)
			case .VERY_UNLIKELY:
				return MythicFateRankStat(title: "Very Unlikely",
										  draw: 3,
										  neededYes: .ALL)
			case .IMPOSSIBLE:
				return MythicFateRankStat(title: "Impossible",
										  draw: 4,
										  neededYes: .ALL)
			case .REALLY_IMPOSSIBLE:
				return MythicFateRankStat(title: "Really Impossible",
										  draw: 5,
										  neededYes: .ALL)
			case .REALLY_REALLY_IMPOSSIBLE:
				return MythicFateRankStat(title: "Really, Really Impossible",
										  draw: 6,
										  neededYes: .ALL)
			case .NONE:
				return MythicFateRankStat(title: "∅",
										  draw: 0,
										  neededYes: .NONE)
		}
	}
}
