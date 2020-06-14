//
//  PETOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class PETGeneratorModel {

}

struct PETCharacter {
	var name: String
	var agenda: PET_AGENDA
	var basePersonalityTags = [PET_PERSONALITY_TAGS_BASE]()
	var advancedPersonalityTags = [PET_PERSONALITY_TAGS_ADVANCED]()
	var seeds = [PET_SEEDS]()
	var focus = [PET_FOCUS_TAGS]()
	var meta: PET_META_TAGS?
}


enum PET_AGENDA: String, RPG_TABLE, Codable {
	typealias Result = PET_AGENDA

	static var MIN: Int = 1
	static var MAX: Int = 11

	case TRUE_FACE_NEGATIVE
	case INEPT
	case FLASHBACK_NEGATIVE
	case UNNOBLE
	case WEAK
	case FOCUSED
	case SKILLED
	case NOBLE
	case FLASHBACK_POSITIVE
	case ON_POINT
	case TRUE_FACE_POSITIVE
	case NONE

	static func getElementBy(value: Int) -> PET_AGENDA {
		switch value  {
			case 1: return .TRUE_FACE_NEGATIVE
			case 2: return .INEPT
			case 3: return .FLASHBACK_NEGATIVE
			case 4: return .UNNOBLE
			case 5: return .WEAK
			case 6: return .FOCUSED
			case 7: return .SKILLED
			case 8: return .NOBLE
			case 9: return .FLASHBACK_POSITIVE
			case 10: return .ON_POINT
			case 11: return .TRUE_FACE_POSITIVE
			default: return .NONE
		}
	}


	static func getDescriptionOfAgenda(_ agenda: PET_AGENDA) -> String {
		switch agenda {
			case .TRUE_FACE_NEGATIVE: return "PC acts out of character in a negative way; a secret revealed."
			case .INEPT: return "Draw a new Seed and interpret it negatively as the PC’s action."
			case .FLASHBACK_NEGATIVE: return "Something from the PC’s backstory negatively influences their action."
			case .UNNOBLE: return "PC indulges or expresses a vice or ignoble facet of their character."
			case .WEAK: return "PC takes the easiest and safest possible option for them."
			case .FOCUSED: return "PC acts in accordance with their current desire or to preserve their well-being. "
			case .SKILLED: return "PC uses an aspect they’re comfortable with (a skill, profession, tactic, or similar). "
			case .NOBLE: return "PC expresses a noble facet of their character."
			case .FLASHBACK_POSITIVE: return "Something from the PC’s backstory positively influences their action."
			case .ON_POINT: return "Draw a new Seed. Play any Seed; interpret it positively as the PC’s action."
			case .TRUE_FACE_POSITIVE: return "PC acts out of character in a positive way; a secret revealed."
			case .NONE: return "NONE"
		}
	}

}


enum PET_PERSONALITY_TAGS_BASE: String, RPG_TABLE, Codable {
	typealias Result = PET_PERSONALITY_TAGS_BASE

	static var MIN: Int = 1
	static var MAX: Int = 36

	case CHATTY
	case ASOCIAL
	case GAMBLER
	case NEEDY
	case SMART
	case CREATIVE
	case RUTHLESS
	case BLUNT
	case GREEDY
	case ASEXUAL
	case CLUMSY
	case DRAMATIC
	case CASUAL
	case TIMID
	case TURTLE
	case CURIOUS
	case FLAKY
	case THESPIAN
	case CHEERFUL
	case RIGID
	case METHODICAL
	case OVER_CONFIDENT
	case RESTLESS
	case TROUBLE
	case INDECISIVE
	case INVESTED
	case WHIMSICAL
	case LECHEROUS
	case FLAMBOYANT
	case LEADER
	case ASSERTIVE
	case ARGUMENTATIVE
	case MERCURIAL
	case PEACEMAKER
	case CHARISMATIC
	case FORGETFUL
	case NONE

	static func getElementBy(value: Int) -> PET_PERSONALITY_TAGS_BASE {
		switch value {
			case 1: return .CHATTY
			case 2: return .ASOCIAL
			case 3: return .GAMBLER
			case 4: return .NEEDY
			case 5: return .SMART
			case 6: return .CREATIVE
			case 7: return .RUTHLESS
			case 8: return .BLUNT
			case 9: return .GREEDY
			case 10: return .ASEXUAL
			case 11: return .CLUMSY
			case 12: return .DRAMATIC
			case 13: return .CASUAL
			case 14: return .TIMID
			case 15: return .TURTLE
			case 16: return .CURIOUS
			case 17: return .FLAKY
			case 18: return .THESPIAN
			case 19: return .CHEERFUL
			case 20: return .RIGID
			case 21: return .METHODICAL
			case 22: return .OVER_CONFIDENT
			case 23: return .RESTLESS
			case 24: return .TROUBLE
			case 25: return .INDECISIVE
			case 26: return .INVESTED
			case 27: return .WHIMSICAL
			case 28: return .LECHEROUS
			case 29: return .FLAMBOYANT
			case 30: return .LEADER
			case 31: return .ASSERTIVE
			case 32: return .ARGUMENTATIVE
			case 33: return .MERCURIAL
			case 34: return .PEACEMAKER
			case 35: return .CHARISMATIC
			case 36: return .FORGETFUL
			default: return .NONE
		}
	}
}


enum PET_PERSONALITY_TAGS_ADVANCED: String, RPG_TABLE, Codable {
	typealias Result = PET_PERSONALITY_TAGS_ADVANCED

	static var MIN: Int = 1
	static var MAX: Int = 36

	case DEMANDING
	case STUBBORN
	case KIND
	case ROMANTIC
	case SENSIBLE
	case FREE
	case HOARDER
	case SPENDTHRIFT
	case ATTENTIVE
	case PRECISE
	case EMPATHETIC
	case CHUMMY
	case DEDICATED
	case PUNS
	case FLIGHTY
	case FIGHTER
	case INATTENTIVE
	case LOUCHE
	case VENGEFUL
	case DETERMINED
	case CALLOUS
	case DEPRESSED
	case EIDETIC
	case DAREDEVIL
	case DEMOCRATIC
	case ARROGANT
	case AVARICIOUS
	case MANIC
	case CARELESS
	case SENSITIVE
	case COMPETITIVE
	case HIDEBOUND
	case CONVENTIONAL
	case QUIXOTIC
	case CAREFUL
	case AMORAL
	case NONE

	static func getElementBy(value: Int) -> PET_PERSONALITY_TAGS_ADVANCED {
		switch value {
			case 1: return .DEMANDING
			case 2: return .STUBBORN
			case 3: return .KIND
			case 4: return .ROMANTIC
			case 5: return .SENSIBLE
			case 6: return .FREE
			case 7: return .HOARDER
			case 8: return .SPENDTHRIFT
			case 9: return .ATTENTIVE
			case 10: return .PRECISE
			case 11: return .EMPATHETIC
			case 12: return .CHUMMY
			case 13: return .DEDICATED
			case 14: return .PUNS
			case 15: return .FLIGHTY
			case 16: return .FIGHTER
			case 17: return .INATTENTIVE
			case 18: return .LOUCHE
			case 19: return .VENGEFUL
			case 20: return .DETERMINED
			case 21: return .CALLOUS
			case 22: return .DEPRESSED
			case 23: return .EIDETIC
			case 24: return .DAREDEVIL
			case 25: return .DEMOCRATIC
			case 26: return .ARROGANT
			case 27: return .AVARICIOUS
			case 28: return .MANIC
			case 29: return .CARELESS
			case 30: return .SENSITIVE
			case 31: return .COMPETITIVE
			case 32: return .HIDEBOUND
			case 33: return .CONVENTIONAL
			case 34: return .QUIXOTIC
			case 35: return .CAREFUL
			case 36: return .AMORAL
			default: return .NONE
		}
	}
}

enum PET_META_TAGS: String, RPG_TABLE, Codable {
	typealias Result = PET_META_TAGS

	static var MIN: Int = 1
	static var MAX: Int = 12

	case TIRED
	case LONG_DAY
	case GRUMPY
	case PHONE_IN
	case UNLUCKY
	case VENDETTA
	case ENRAGED
	case INVESTED
	case LATE
	case LUCKY
	case SYNCED
	case IN_ZONE
	case NONE

	static func getElementBy(value: Int) -> PET_META_TAGS {
		switch value {
			case 1: return .TIRED
			case 2: return .LONG_DAY
			case 3: return .GRUMPY
			case 4: return .PHONE_IN
			case 5: return .UNLUCKY
			case 6: return .VENDETTA
			case 7: return .ENRAGED
			case 8: return .INVESTED
			case 9: return .LATE
			case 10: return .LUCKY
			case 11: return .SYNCED
			case 12: return .IN_ZONE
			default: return .NONE
		}
	}
}


enum PET_FOCUS_TAGS: String, RPG_TABLE, Codable {
	typealias Result = PET_FOCUS_TAGS

	static var MIN: Int = 1
	static var MAX: Int = 12

	case FAME
	case BACKSTORY
	case RIVALRY
	case WEALTH
	case ROMANCE
	case ITEM
	case KNOWLEDGE
	case SEX
	case DOMINATE
	case MAGIC
	case EXPLORE
	case CRUSH_FOE
	case DO_GOOD
	case CONFLICT
	case UPLIFT_ALLY
	case MAYHEM
	case PROVE_SELF
	case INFAMY
	case NONE

	static func getElementBy(value: Int) -> PET_FOCUS_TAGS {
		switch value {
			case 1: return .FAME
			case 2: return .BACKSTORY
			case 3: return .RIVALRY
			case 4: return .WEALTH
			case 5: return .ROMANCE
			case 6: return .ITEM
			case 7: return .KNOWLEDGE
			case 8: return .SEX
			case 9: return .DOMINATE
			case 10: return .MAGIC
			case 11: return .EXPLORE
			case 12: return .CRUSH_FOE
			case 13: return .DO_GOOD
			case 14: return .CONFLICT
			case 15: return .UPLIFT_ALLY
			case 16: return .MAYHEM
			case 17: return .PROVE_SELF
			case 18: return .INFAMY
			default: return .NONE
		}
	}
}

enum PET_SEEDS: String, RPG_TABLE, Codable {
	typealias Result = PET_SEEDS

	static var MIN: Int = 1
	static var MAX: Int = 12

	case SEEK
	case HELP
	case CHANGE
	case FIGHT
	case HINDER
	case STOP
	case QUESTION
	case DESTROY
	case PURSUE
	case KEY
	case EMOTION
	case HISTORY
	case DANGER
	case REWARD
	case PERSON
	case DARKNESS
	case PASSION
	case GOAL
	case NONE

	static func getElementBy(value: Int) -> PET_SEEDS {
		switch value {
			case 1: return .SEEK
			case 2: return .HELP
			case 3: return .CHANGE
			case 4: return .FIGHT
			case 5: return .HINDER
			case 6: return .STOP
			case 7: return .QUESTION
			case 8: return .DESTROY
			case 9: return .PURSUE
			case 10: return .KEY
			case 11: return .EMOTION
			case 12: return .HISTORY
			case 13: return .DANGER
			case 14: return .REWARD
			case 15: return .PERSON
			case 16: return .DARKNESS
			case 17: return .PASSION
			case 18: return .GOAL
			default: return .NONE
		}
	}
}


enum PET_ORACLE: String, RPG_TABLE {
	typealias Result = PET_ORACLE

	static var MIN: Int = 2
	static var MAX: Int = 12

	case GET_WHAT_PC_WANTS = "Get what PC wants."
	case GWYW_WITH_CONFLICT = "Get what PC want with interparty conflict."
	case CONFLICT_DO_NOT_GET = "PC does not get what PC want, and with interparty conflict."
	case NONE

	static func getElementBy(value: Int) -> PET_ORACLE {
		switch value {
			case 2...6: return .CONFLICT_DO_NOT_GET
			case 7...9: return .GWYW_WITH_CONFLICT
			case 10...12: return .GET_WHAT_PC_WANTS
			default: return .NONE
		}
	}

}
