//
//  CypherOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation


struct CypherOracleModel {
	var result: String
	var twist: String
}

enum CYPHER_ADVENTURE_STATUS: Int, CaseIterable {
	case SOLID = 1
	case STABLE = 2
	case AVERAGE = 3
	case UNSTABLE = 4
	case INSANE = 5
	case CHAOS = 6
}

enum CYPHER_GM_CONSULT: Int, CaseIterable {
	case VERY_LIKELY = 1
	case LIKELY = 2
	case AVERAGE = 3
	case UNLIKELY = 4
	case VERY_UNLIKELY = 5
	case IMPROBABLE = 6
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
