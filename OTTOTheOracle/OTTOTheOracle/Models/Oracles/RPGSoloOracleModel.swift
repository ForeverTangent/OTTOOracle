//
//  RPGSoloOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/6/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

struct RPGSoloOracleModel {
	var result: String
	var twist: String
}


enum RPG_SOLO_ORACLE: String, RPG_TABLE {
	typealias Result = String

	static var MIN: Int = 1
	static var MAX: Int = 6

	case NO_AND = "No, and..."
	case NO = "No"
	case NO_BUT = "No, but..."
	case YES_BUT = "Yes, but..."
	case YES = "Yes"
	case YES_AND = "Yes, and..."
	case NONE = "NONE"

	static func getElementBy(value: Int) -> String {
		switch value {
			case 1: return NO_AND.rawValue
			case 2: return NO.rawValue
			case 3: return NO_BUT.rawValue
			case 4: return YES_BUT.rawValue
			case 5: return YES.rawValue
			case 6: return YES_AND.rawValue
			default:
				return NONE.rawValue
		}
	}
}


enum RPG_SOLO_TWIST_1: String, RPG_TABLE {
	typealias Result = String

	static var MIN: Int = 1
	static var MAX: Int = 6

	case NPC = "NPC"
	case PC = "PC"
	case ORGANIZATION = "Organization"
	case PHYSICAL_EVENT = "Physicial Event"
	case EMOTIONAL_EVENT = "Emotional Event"
	case ITEM = "Item"
	case NONE = "NONE"

	static func getElementBy(value: Int) -> String {
		switch value {
			case 1: return NPC.rawValue
			case 2: return PC.rawValue
			case 3: return ORGANIZATION.rawValue
			case 4: return PHYSICAL_EVENT.rawValue
			case 5: return EMOTIONAL_EVENT.rawValue
			case 6: return ITEM.rawValue
			default:
				return NONE.rawValue
		}
	}
}


enum RPG_SOLO_TWIST_2: String, RPG_TABLE {
	typealias Result = String

	static var MIN: Int = 1
	static var MAX: Int = 6

	case APPEARS = "Appears"
	case ALTERS_THE_LOCATION = "Alters the location"
	case HELPS_THE_PROTAGONIST = "Helps the protagonist"
	case HENDERS_THE_PROTAGONIST = "Henders the protagonist"
	case CHANGES_THE_GOAL = "Changes the goal"
	case ENDS_THE_SCENE = "ENDS_THE_SCENE"
	case NONE = "NONE"

	static func getElementBy(value: Int) -> String {
		switch value {
			case 1: return APPEARS.rawValue
			case 2: return ALTERS_THE_LOCATION.rawValue
			case 3: return HELPS_THE_PROTAGONIST.rawValue
			case 4: return HENDERS_THE_PROTAGONIST.rawValue
			case 5: return CHANGES_THE_GOAL.rawValue
			case 6: return ENDS_THE_SCENE.rawValue
			default:
				return NONE.rawValue
		}
	}
}

enum RPG_SOLO_NEXT_SCENE: String, RPG_TABLE {
	typealias Result = String

	static var MIN: Int = 1
	static var MAX: Int = 6

	case DRAMATIC_SCENE = "Dramatic Scene"
	case QUIET_SCENE = "Quiet Scene"
	case MEANWHILE = "Meanwhile"
	case NONE = "NONE"

	static func getElementBy(value: Int) -> String {
		switch value {
			case 1...3: return DRAMATIC_SCENE.rawValue
			case 4...5: return QUIET_SCENE.rawValue
			case 6: return MEANWHILE.rawValue
			default:
				return NONE.rawValue
		}
	}
}
