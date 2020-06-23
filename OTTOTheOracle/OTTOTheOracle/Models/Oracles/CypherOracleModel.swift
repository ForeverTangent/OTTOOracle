//
//  CypherOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation


class CypherOracleModel {
	var d20 = Die(maxPips: 20)

	var adventureStatus: CYPHER_ADVENTURE_STATUS = .AVERAGE

	func getOracleResultFor(adventureStatus: CYPHER_ADVENTURE_STATUS, gmConsult: CYPHER_GM_CONSULT) -> CypherResult {
		
		let oracleRoll = d20.roll()
		let developerRoll = d20.roll()

		let oracleAnswer: CYPHER_ANSWER = oracleRoll >= (gmConsult.rawValue * 3) ? .YES : .NO
		let oracleModifierAnswer: CYPHER_ANSWER = developerRoll < (adventureStatus.rawValue * 3) ? .YES : .NO

		if oracleModifierAnswer == .YES {
			return CypherResult(oracleAnswer: oracleAnswer, developer: CYPHER_DEVELOPER.getRolledRandomElement())
		}

		return CypherResult(oracleAnswer: oracleAnswer, developer: .NONE)
	}
}


struct CypherResult {
	var oracleAnswer: CYPHER_ANSWER
	var developer: CYPHER_DEVELOPER
}


enum CYPHER_ANSWER: String {
	case YES
	case NO
}

/**
This Enum is Int based so we can use it with a slider
*/
enum CYPHER_ADVENTURE_STATUS: Int, RPG_TABLE {
	typealias Result = CYPHER_ADVENTURE_STATUS

	static var MIN: Int = 1
	static var MAX: Int = 6

	case SOLID = 1
	case STABLE = 2
	case AVERAGE = 3
	case UNSTABLE = 4
	case INSANE = 5
	case CHAOS = 6
	case NONE = 0

	var descriptionShort: String {
		get {
			switch self {
				case .SOLID: return "Solid"
				case .STABLE: return "Stable"
				case .AVERAGE: return "Average"
				case .UNSTABLE: return "Unstable"
				case .INSANE: return "Insane"
				case .CHAOS: return "Chaos"
				case .NONE: return "None"
			}
		}
	}
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> CYPHER_ADVENTURE_STATUS {
		switch value {
			case 1: return .SOLID
			case 2: return .STABLE
			case 3: return .AVERAGE
			case 4: return .UNSTABLE
			case 5: return .INSANE
			case 6: return .CHAOS
			default: return .NONE
		}
	}

}

/**
This Enum is Int based so we can use it with a slider
*/
enum CYPHER_GM_CONSULT: Int, RPG_TABLE {
	typealias Result = CYPHER_GM_CONSULT

	static var MIN: Int = 1
	static var MAX: Int = 6

	case NONE = 0
	case VERY_LIKELY = 1
	case LIKELY = 2
	case AVERAGE = 3
	case UNLIKELY = 4
	case VERY_UNLIKELY = 5
	case IMPROBABLE = 6


	var descriptionShort: String {
		get {
			switch self {
				case .VERY_LIKELY: return "Very Likely"
				case .LIKELY: return "Likely"
				case .AVERAGE: return "Average"
				case .UNLIKELY: return "Unlikely"
				case .VERY_UNLIKELY: return "Very Unlikely"
				case .IMPROBABLE: return "Improbable"
				case .NONE: return "None"
			}
		}
	}
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> CYPHER_GM_CONSULT {
		switch value {
			case 1: return .VERY_LIKELY
			case 2: return .LIKELY
			case 3: return .AVERAGE
			case 4: return .UNLIKELY
			case 5: return .VERY_UNLIKELY
			case 6: return .IMPROBABLE
			default: return .NONE
		}
	}
}

enum CYPHER_DEVELOPER: String, RPG_TABLE {
	typealias Result = CYPHER_DEVELOPER

	static var MIN: Int = 1
	static var MAX: Int = 20

	case AND = "And..."
	case BUT = "But..."
	case INTRO_NEW_THEME = "Introduce a new theme..."
	case RETREAT_FROM_THEME = "Retreat from a theme..."
	case INCREASE_TASK_LEVEL = "Increase task level..."
	case DECREASE_TASK_LEVEL = "Decrease task level by one step..."
	case DISCOVER_CYPHER = "Discover Cypher..."
	case AUTOMATIC_SUCCESS = "Automatic success..."
	case AUTOMATIC_FAILURE = "Automatic failure..."
	case PC_INHIBITOR = "PC Inhibitor..."
	case PC_ENABLER = "PC Enabler..."
	case NPC_INHIBITOR = "NPC Inhibitor..."
	case NPC_ENABLER = "NPC Enabler..."
	case NONE = "NONE"

	var descriptionShort: String {
		get {
			return rawValue
		}
	}
	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_DEVELOPER {
		switch value {
			case 1...2: return .AND
			case 3...4: return .BUT
			case 5: return .INTRO_NEW_THEME
			case 6: return .RETREAT_FROM_THEME
			case 7: return .INCREASE_TASK_LEVEL
			case 8: return .DECREASE_TASK_LEVEL
			case 9...10: return .DISCOVER_CYPHER
			case 11: return .AUTOMATIC_SUCCESS
			case 12: return .AUTOMATIC_FAILURE
			case 13...14: return .PC_INHIBITOR
			case 15...16: return .PC_ENABLER
			case 17...18: return .NPC_INHIBITOR
			case 19...20: return .NPC_ENABLER
			default: return .NONE
		}
	}

}
