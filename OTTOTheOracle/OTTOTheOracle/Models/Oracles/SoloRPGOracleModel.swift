//
//  RPGSoloOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/6/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class SoloRPGOracleModel {

	public func getResults() -> SoloRPGOracleResult {

		let answer = RPG_SOLO_ORACLE.randomWeightedElement()
		let twist = getTwist()

		return SoloRPGOracleResult(answer: answer,
								   twist_subject: twist.subject,
								   twist_verb: twist.verb)
	}

	private func getTwist() -> (subject: RPG_SOLO_TWIST_1, verb: RPG_SOLO_TWIST_2) {
		let d6 = Die(maxPips: 6)

		if d6.roll() != 1 {
			return (RPG_SOLO_TWIST_1.NONE, RPG_SOLO_TWIST_2.NONE)
		}

		return (RPG_SOLO_TWIST_1.randomWeightedElement(), RPG_SOLO_TWIST_2.randomWeightedElement())
	}

}

struct SoloRPGOracleResult {
	var answer: RPG_SOLO_ORACLE
	var twist_subject: RPG_SOLO_TWIST_1
	var twist_verb: RPG_SOLO_TWIST_2
}



enum RPG_SOLO_ORACLE: String, RPG_TABLE {
	typealias Result = RPG_SOLO_ORACLE

	static var MIN: Int = 1
	static var MAX: Int = 6

	case NO_AND = "No, and..."
	case NO = "No"
	case NO_BUT = "No, but..."
	case YES_BUT = "Yes, but..."
	case YES = "Yes"
	case YES_AND = "Yes, and..."
	case NONE = "NONE"

	static func getElementBy(value: Int) -> RPG_SOLO_ORACLE {
		switch value {
			case 1: return NO_AND
			case 2: return NO
			case 3: return NO_BUT
			case 4: return YES_BUT
			case 5: return YES
			case 6: return YES_AND
			default:
				return NONE
		}
	}

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

}


enum RPG_SOLO_TWIST_1: String, RPG_TABLE {
	typealias Result = RPG_SOLO_TWIST_1

	static var MIN: Int = 1
	static var MAX: Int = 6

	case NPC = "NPC"
	case PC = "PC"
	case ORGANIZATION = "Organization"
	case PHYSICAL_EVENT = "Physicial Event"
	case EMOTIONAL_EVENT = "Emotional Event"
	case ITEM = "Item"
	case NONE = "NONE"

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> RPG_SOLO_TWIST_1 {
		switch value {
			case 1: return NPC
			case 2: return PC
			case 3: return ORGANIZATION
			case 4: return PHYSICAL_EVENT
			case 5: return EMOTIONAL_EVENT
			case 6: return ITEM
			default:
				return NONE
		}
	}
}


enum RPG_SOLO_TWIST_2: String, RPG_TABLE {
	typealias Result = RPG_SOLO_TWIST_2

	static var MIN: Int = 1
	static var MAX: Int = 6

	case APPEARS = "Appears"
	case ALTERS_THE_LOCATION = "Alters the location"
	case HELPS_THE_PROTAGONIST = "Helps the protagonist"
	case HENDERS_THE_PROTAGONIST = "Henders the protagonist"
	case CHANGES_THE_GOAL = "Changes the goal"
	case ENDS_THE_SCENE = "ENDS_THE_SCENE"
	case NONE = "NONE"

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }


	static func getElementBy(value: Int) -> RPG_SOLO_TWIST_2 {
		switch value {
			case 1: return APPEARS
			case 2: return ALTERS_THE_LOCATION
			case 3: return HELPS_THE_PROTAGONIST
			case 4: return HENDERS_THE_PROTAGONIST
			case 5: return CHANGES_THE_GOAL
			case 6: return ENDS_THE_SCENE
			default:
				return NONE
		}
	}
}

enum RPG_SOLO_NEXT_SCENE: String, RPG_TABLE {
	typealias Result = RPG_SOLO_NEXT_SCENE

	static var MIN: Int = 1
	static var MAX: Int = 6

	case DRAMATIC_SCENE = "Dramatic Scene"
	case QUIET_SCENE = "Quiet Scene"
	case MEANWHILE = "Meanwhile"
	case NONE = "NONE"

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> RPG_SOLO_NEXT_SCENE {
		switch value {
			case 1...3: return DRAMATIC_SCENE
			case 4...5: return QUIET_SCENE
			case 6: return MEANWHILE
			default:
				return NONE
		}
	}
}
