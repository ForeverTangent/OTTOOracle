//
//  CRGEOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class CRGEOracleModel {
	var surge: Int = 0
}


enum CRGE_TO_KNOWLEDGE: String, RPG_TABLE {

	typealias Result = CRGE_TO_KNOWLEDGE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case YES_AND_UNEXPECTEDLY = "Yes, and unexpectedly..."
	case YES_BUT = "Yes, but..."
	case YES_AND = "Yes, and..."
	case YES = "Yes."
	case NO = "No."
	case NO_AND = "No, and..."
	case NO_BUT = "No, but..."
	case NO_AND_UNEXPECTEDLY = "No, and unexpectedly..."
	case NONE = "NONE"

	static func getElementBy(value: Int) -> CRGE_TO_KNOWLEDGE {
		switch value {
			case 1...5: return .NO_AND_UNEXPECTEDLY
			case 6...15: return .NO_BUT
			case 16...20: return .NO_AND
			case 21...50: return .NO
			case 51...80: return .YES
			case 81...85: return .YES_AND
			case 86...95: return .YES_BUT
			case 96...100: return .YES_AND_UNEXPECTEDLY
			default: return .NONE
		}
	}

}


enum CRGE_TO_CONFLICT: String, RPG_TABLE {

	typealias Result = CRGE_TO_CONFLICT

	static var MIN: Int = 1
	static var MAX: Int = 100

	case YES_AND_UNEXPECTEDLY = "Yes, and unexpectedly..."
	case YES_BUT = "Yes, but..."
	case YES_AND = "Yes, and..."
	case YES = "Yes."
	case NO = "No."
	case NO_AND = "No, and..."
	case NO_BUT = "No, but..."
	case NO_AND_UNEXPECTEDLY = "No, and unexpectedly..."
	case NONE = "NONE"

	static func getElementBy(value: Int) -> CRGE_TO_CONFLICT {
		switch value {
			case 1...2: return .NO_AND_UNEXPECTEDLY
			case 3...6: return .NO_BUT
			case 7...16: return .NO_AND
			case 17...50: return .NO
			case 51...84: return .YES
			case 85...94: return .YES_AND
			case 95...98: return .YES_BUT
			case 99...100: return .YES_AND_UNEXPECTEDLY
			default: return .NONE
		}
	}

}


enum CRGE_TO_ENDINGS: String, RPG_TABLE {

	typealias Result = CRGE_TO_ENDINGS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case YES_AND_UNEXPECTEDLY = "Yes, and unexpectedly..."
	case YES_BUT = "Yes, but..."
	case YES_AND = "Yes, and..."
	case YES = "Yes."
	case NO = "No."
	case NO_AND = "No, and..."
	case NO_BUT = "No, but..."
	case NO_AND_UNEXPECTEDLY = "No, and unexpectedly..."
	case NONE = "NONE"

	static func getElementBy(value: Int) -> CRGE_TO_ENDINGS {
		switch value {
			case 1: return .NO_AND_UNEXPECTEDLY
			case 2: return .NO_BUT
			case 3...20: return .NO_AND
			case 21...50: return .NO
			case 51...80: return .YES
			case 81...98: return .YES_AND
			case 99: return .YES_BUT
			case 100: return .YES_AND_UNEXPECTEDLY
			default: return .NONE
		}
	}

}


enum CRGE_UNEXPECTEDLY: String, RPG_TABLE {



	typealias Result = CRGE_UNEXPECTEDLY

	static var MIN: Int = 1
	static var MAX: Int = 17

	case FORESHADOWING
	case TYING_OFF
	case TO_CONFLICT
	case COSTUME_CHANGE
	case KEY_GRIP
	case TO_KNOWLEDGE
	case FRAMING
	case SET_CHANGE
	case UPSTAGED
	case PATTERN_CHANGE
	case LIMELIT
	case ENTERING_THE_RED
	case TO_ENDINGS
	case MONTAGE
	case ENTER_STAGE_LEFT
	case CROSS_STITCH
	case SIX_DEGREES
	case RE_ROLL_RESERVERED_1
	case RE_ROLL_RESERVERED_2
	case RE_ROLL_RESERVERED_3
	case NONE

	static func getElementBy(value: Int) -> CRGE_UNEXPECTEDLY {
		switch value {
			case 1: return .FORESHADOWING
			case 2: return .TYING_OFF
			case 3: return .TO_CONFLICT
			case 4: return .COSTUME_CHANGE
			case 5: return .KEY_GRIP
			case 6: return .TO_KNOWLEDGE
			case 7: return .FRAMING
			case 8: return .SET_CHANGE
			case 9: return .UPSTAGED
			case 10: return .PATTERN_CHANGE
			case 11: return .LIMELIT
			case 12: return .ENTERING_THE_RED
			case 13: return .TO_ENDINGS
			case 14: return .MONTAGE
			case 15: return .ENTER_STAGE_LEFT
			case 16: return .CROSS_STITCH
			case 17: return .SIX_DEGREES
			default: return .NONE

		}
	}



}
