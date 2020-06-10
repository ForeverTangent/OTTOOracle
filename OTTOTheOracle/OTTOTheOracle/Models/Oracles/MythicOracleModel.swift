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

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "MythicOracleModel"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

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

	func getOracleResultFor(mythicFateRank: MYTHIC_FATE_RANK) -> Bool {
		guard let chaosDrawAdjustment = chaosFactorToDrawAdjustment[currentMythicChaosLevel] else { return true }

		let mythicFateRank = MYTHIC_FATE_RANK.getMythicRankStatsFor(mythicFateRank)

		os_log(.default, log: logger, "Rank draw: %d", mythicFateRank.draw)
		os_log(.default, log: logger, "Chaos adjsutment: %d", chaosDrawAdjustment)

		var numberOfCardsToDraw = mythicFateRank.draw + chaosDrawAdjustment
		numberOfCardsToDraw = numberOfCardsToDraw < 1 ? 1 : numberOfCardsToDraw

		print("numberOfCardsToDraw: \(numberOfCardsToDraw)")


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

enum MYTHIC_ORACLE_ANSWER: Int, CaseIterable {
	case NO_EXCEPTIONAL
	case NO
	case YES
	case YES_EXCEPTIONAL
	case NONE
}

struct MythicFateRankStat {
	var title: String
	var draw: Int
	var neededYes: MYTHIC_YES_DRAW

}

enum MYTHIC_YES_DRAW: String, CaseIterable {
	case ANY = "ANY"
	case ALL = "ALL"
	case NONE = "NONE"
}

enum MYTHIC_FATE_RANK: Int, CaseIterable {
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
