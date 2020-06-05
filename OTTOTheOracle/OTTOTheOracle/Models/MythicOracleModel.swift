//
//  MythicOracleAnswerResult.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/5/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation


struct MythicOracleModel {
	var oracleAnswer: MYTHIC_ORACLE_ANSWER
	var mythicChaosLevel: Int = 5
}

enum MYTHIC_ORACLE_ANSWER: Int, CaseIterable {
	case NO_EXCEPTIONAL
	case NO
	case YES
	case YES_EXCEPTIONAL
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
	case REALLY_REALLY_HAS_TO_BE
	case REALLY_HAS_TO_BE
	case HAS_TO_BE
	case VERY_LIKELY
	case LIKELY
	case FIFTY_FIFTY
	case UNLIKELY
	case VERY_UNLIKELY
	case IMPOSSIBLE
	case REALLY_IMPOSSIBLE
	case REALLY_REALLY_IMPOSSIBLE
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
