//
//  PETOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import GameplayKit.GKStateMachine
import GameplayKit.GKState

class PETGeneratorModel {

	var petCharacter = PETCharacter()

	public func buildNewPETCharacter() {
		let petCharacter = PETCharacter(name: "",
										agenda: PET_AGENDA.getRolledRandomElement(),
										personalityTags: generatePersonalityTags(),
										seeds: generateFocusTags(),
										focusTags: generateFocusTags())
		self.petCharacter = petCharacter
	}

	private func generatePersonalityTags() -> [PET_PERSONALITY_TAGS_BASE] {
		let numberOfTags = Int.random(in: 1...3)
		var tags = [PET_PERSONALITY_TAGS_BASE]()
		for _ in 1...numberOfTags {
			tags.append(PET_PERSONALITY_TAGS_BASE.getRolledRandomElement())
		}
		return tags
	}

	private func generateFocusTags() -> [PET_FOCUS_TAGS] {
		var focus = [PET_FOCUS_TAGS]()
		for _ in 1...2 {
			focus.append(PET_FOCUS_TAGS.getRolledRandomElement())
		}
		return focus
	}

	private func generateFocusTags() -> [PET_SEEDS] {
		var seeds = [PET_SEEDS]()
		for _ in 1...3 {
			seeds.append(PET_SEEDS.getRolledRandomElement())
		}
		return seeds
	}

	func addPersonalityTag() {
	}

}

extension PETGeneratorModel: OTTOBuildCharacter {
	typealias CharacterType = PETCharacter

	func buildNewCharacter() -> PETCharacter {
		return petCharacter
	}
}


class PETAPMStateMachine: GKStateMachine {
//	func canEnterState(AnyClass) -> Bool
//	Returns a Boolean value indicating whether it is valid for the state machine to transition from its current state to a state of the specified class.
//	func enter(AnyClass) -> Bool
//	Attempts to transition the state machine from its current state to a state of the specified class.
//	func update(deltaTime: TimeInterval)
//	Tells the current state object to perform per-frame updates.

}

class PETAPMState: GKState {
//	func isValidNextState(AnyClass) -> Bool
//	Returns a Boolean value indicating whether a state machine currently in this state is allowed to transition into the specified state.
//	Transitions and Updates
//	func didEnter(from: GKState?)
//	Performs custom actions when a state machine transitions into this state.
//	func update(deltaTime: TimeInterval)
//	Performs custom actions when a state machine updates while in this state.
//	func willExit(to: GKState)
//	Performs custom actions when a state machine transitions out of this state.
}

struct PETCharacter {
	var name: String = ""
	var agenda: PET_AGENDA = .NONE
	var personalityTags = [PET_PERSONALITY_TAGS_BASE]()
	var seeds = [PET_SEEDS]()
	var focusTags = [PET_FOCUS_TAGS]()
}

extension PETCharacter: CustomStringConvertible {

	var description: String {
		get {
			return """
			\tname: \(self.name)
			\tagenda: \(self.agenda)
			\tPersonality Tags: \(self.personalityTags)
			\tFocus Tags: \(self.focusTags)
			\tseeds: \(self.seeds)
			"""
		}
	}

}


enum PET_AGENDA: String, RPG_TABLE {
	typealias EnumerationType = PET_AGENDA

	static var MIN: Int = 1
	static var MAX: Int = 9

	case TRUE_FACE
	case INEPT
	case FLASHBACK
	case UNNOBLE
	case WEAK
	case FOCUSED
	case SKILLED
	case NOBLE
	case ON_POINT
	case NONE

	var descriptionShort: String { get { return rawValue.getEnumFormmatted() } }
	var descriptionLong: String {
		get {
			switch self {
				case .TRUE_FACE:
					return "Loves secrets and dramatic re-veals; good or bad, himself or someone else."
				case .INEPT:
					return "Chaotic, bored, and not paying attention. Will try to assassinate anyone who might have good loot or for laughs."
				case .FLASHBACK:
					return "All about backstory and character development, but focused on her own character and pet NPCs."
				case .UNNOBLE:
					return "Cares about keeping his character intact and about amassing something of value – name it."
				case .WEAK:
					return "Craves new experiences, escapism. Not chaotic but doesn’t think about her allies before acting on temptation."
				case .FOCUSED:
					return "Wants to play the game he signed up for, do what’s on his character sheet, and avoid too much of any one game aspect."
				case .SKILLED:
					return "Plays skilled or flexible characters; wants to show that off. Motto: 'if all you’ve got is a hammer, everything looks like a nail'."
				case .NOBLE:
					return "Wants to do the right thing and sacrifice herself for the greater good, preferably, while being recognized and suffering for it."
				case .ON_POINT:
					return "Brings his best game. Always pushes the story and adventure towards a dramatic and satisfying conclusion."
				default: return "None"
			}
		}
	}

	static func getElementBy(value: Int) -> PET_AGENDA {
		switch value {
			case 1: return .TRUE_FACE
			case 2: return .INEPT
			case 3: return .FLASHBACK
			case 4: return .UNNOBLE
			case 5: return .WEAK
			case 6: return .FOCUSED
			case 7: return .SKILLED
			case 8: return .NOBLE
			case 9: return .ON_POINT
			default: return .NONE
		}
	}

}


enum PET_PLAYER_MOVES: String, RPG_TABLE, RPG_TABLE_STRING_VALUE {
	typealias Result = PET_PLAYER_MOVES

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

	var descriptionShort: String {
		get {
			return rawValue.getEnumFormmatted()
		}
	}
	var descriptionLong: String {
		get {
			switch self {
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

	static func getElementBy(value: Int) -> PET_PLAYER_MOVES {
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

	static func getRolledRandomElement() -> PET_PLAYER_MOVES {
		let d1 = Die(maxPips: 6)
		let d2 = Die(maxPips: 6)

		let roll = d1.roll() + d2.roll()

		switch roll {
			case 2: return .TRUE_FACE_NEGATIVE
			case 3: return .INEPT
			case 4: return .FLASHBACK_NEGATIVE
			case 5: return .UNNOBLE
			case 6: return .WEAK
			case 7: return .FOCUSED
			case 8: return .SKILLED
			case 9: return .NOBLE
			case 10: return .FLASHBACK_POSITIVE
			case 11: return .ON_POINT
			case 12: return .TRUE_FACE_POSITIVE
			default: return .NONE
		}
	}


	func getStringEnumValue() -> Int {
		switch self {
			case .TRUE_FACE_NEGATIVE: return 2
			case .INEPT: return 3
			case .FLASHBACK_NEGATIVE: return 4
			case .UNNOBLE: return 5
			case .WEAK: return 6
			case .FOCUSED: return 7
			case .SKILLED: return 8
			case .NOBLE: return 9
			case .FLASHBACK_POSITIVE: return 10
			case .ON_POINT: return 11
			case .TRUE_FACE_POSITIVE: return 12
			case .NONE: return 0
		}
	}

}


enum PET_PERSONALITY_TAGS_BASE: String, RPG_TABLE, Codable {
	typealias Result = PET_PERSONALITY_TAGS_BASE

	static var MIN: Int = 1
	static var MAX: Int = 36

	case NONE
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
	// PET_PERSONALITY_TAGS_ADVANCED
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

	var descriptionShort: String { get { return rawValue.getEnumFormmatted() } }
	var descriptionLong: String { get { return descriptionShort } }

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

	static func getRandomAdvancedTag() -> PET_PERSONALITY_TAGS_BASE {
		let value = Int.random(in: 1...36)
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

	var descriptionShort: String { get { return rawValue.getEnumFormmatted() } }

	var descriptionLong: String {
		get {
			switch self {
				case .TIRED: return "If the Move dice match, the result is 'Inept'."
				case .LONG_DAY: return "Minor penalty (-1) to all rolls."
				case .GRUMPY: return "-1 to all Move and Oracle rolls."
				case .PHONE_IN: return "Adjust all Move rolls one step lower."
				case .UNLUCKY: return "-1 to all Oracle rolls that affect her directly."
				case .VENDETTA: return "If Move dice match, a minor Intraparty Conflict, two 1s, major."
				case .ENRAGED: return "Adjust all Move rolls one step higher."
				case .INVESTED: return "If the Move dice match, you pick the result."
				case .LATE: return "Under direct GM control until any two dice on a roll match."
				case .LUCKY: return "+1 to all Oracle rolls that affect him directly."
				case .SYNCED: return "Pick another Player; move rolls towards that Player’s Agenda."
				case .IN_ZONE: return "If Move dice match, the result is 'On Point'"
				case .NONE: return "None"
			}
		}
	}

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

	var descriptionShort: String { get { return rawValue.getEnumFormmatted() } }
	var descriptionLong: String { get { return descriptionShort } }

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

	var descriptionShort: String { get { return rawValue.getEnumFormmatted() } }
	var descriptionLong: String { get { return descriptionShort } }

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

	case GET_WHAT_PC_WANTS
	case GWYW_WITH_CONFLICT
	case CONFLICT_DO_NOT_GET
	case NONE

	var descriptionShort: String { get { return rawValue.getEnumFormmatted() } }
	var descriptionLong: String {
		get {
			switch self {
				case .GET_WHAT_PC_WANTS: return "Get what PC wants."
				case .GWYW_WITH_CONFLICT: return "Get what PC want with interparty conflict."
				case .CONFLICT_DO_NOT_GET: return "PC does not get what PC want, and with interparty conflict."
				case .NONE: return "None"
			}
		}
	}

	static func getElementBy(value: Int) -> PET_ORACLE {
		switch value {
			case 2...6: return .CONFLICT_DO_NOT_GET
			case 7...9: return .GWYW_WITH_CONFLICT
			case 10...12: return .GET_WHAT_PC_WANTS
			default: return .NONE
		}
	}

	static func getRolledRandomElement() -> PET_ORACLE {
		let d1 = Die(maxPips: 6)
		let d2 = Die(maxPips: 6)

		let total = d1.roll() + d2.roll()

		switch total {
			case 2...6: return .CONFLICT_DO_NOT_GET
			case 7...9: return .GWYW_WITH_CONFLICT
			case 10...12: return .GET_WHAT_PC_WANTS
			default: return .NONE
		}
	}

}
