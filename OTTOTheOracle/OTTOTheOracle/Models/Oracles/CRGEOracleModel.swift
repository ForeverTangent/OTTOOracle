//
//  CRGEOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class CRGEOracleModel {

	var d100 = Die(maxPips: 100)
	var surge: Int = 0


	public func getOracleResultFor(stage: CRGE_STAGE,
								   withSurge surge: Int = 0) -> CRGEOracleResult {

		var surgeReturn = 0
		var answer: String

		switch stage {
			case .KNOWLEDGE:
				answer = getKnowledgeResult(withSurge: surge)
			case .CONFLICT:
				answer = getConflictResult(withSurge: surge)
			case .ENDINGS:
				answer = getEndingsResult(withSurge: surge)
		}

		print(answer)

		if getIncreaseSurge(answer: answer) {
			surgeReturn = surge + 2
		} else {
			surgeReturn = 0
		}

		print("surgeReturn: \(surgeReturn)")

		let unexpectedResults = CRGE_UNEXPECTEDLY.getRolledRandomElement()

		return CRGEOracleResult(surge: surgeReturn,
								answer: answer,
								unexpected: unexpectedResults)

	}

	private func getKnowledgeResult(withSurge surge: Int = 0) -> String {
		let dieResult = d100.roll() + surge
		return CRGE_TO_KNOWLEDGE.getElementBy(value: dieResult).rawValue
	}

	private func getConflictResult(withSurge surge: Int = 0) -> String {
		let dieResult = d100.roll() + surge
		return CRGE_TO_CONFLICT.getElementBy(value: dieResult).rawValue
	}

	private func getEndingsResult(withSurge surge: Int = 0) -> String {
		let dieResult = d100.roll() + surge
		return CRGE_TO_ENDINGS.getElementBy(value: dieResult).rawValue
	}

	private func getIncreaseSurge(answer: String) -> Bool {

		print(answer)

		if answer.lowercased().contains("and".lowercased()) {
			return true
		}

		if answer.lowercased().contains("but".lowercased()) {
			return true
		}

		return false
	}

	private func getIfUnexpected(oracleResult: String) -> Bool {
		if oracleResult.contains("unexpectedly") || oracleResult.contains("unexpectedly") { return true }
		return false
	}


}

struct CRGEOracleResult {
	var surge: Int
	var answer: String
	var unexpected: CRGE_UNEXPECTEDLY
}


enum CRGE_STAGE: Int {
	case KNOWLEDGE = 0
	case CONFLICT = 1
	case ENDINGS = 2

	static func getStageString(_ rank: CRGE_STAGE) -> String {
		switch rank {
			case .KNOWLEDGE: return "To Knowledge..."
			case .CONFLICT: return "To Conflict..."
			case .ENDINGS: return "To Endings..."
		}
	}
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

	case FORESHADOWING = "Foreshadowing..."
	case TYING_OFF = "Tying off..."
	case TO_CONFLICT = "To conflict..."
	case COSTUME_CHANGE = "Costume Change..."
	case KEY_GRIP = "Key grip..."
	case TO_KNOWLEDGE = "To knowledge..."
	case FRAMING = "Framing..."
	case SET_CHANGE = "Set change..."
	case UPSTAGED = "Upstaged..."
	case PATTERN_CHANGE = "Pattern change..."
	case LIMELIT = "Limelit..."
	case ENTERING_THE_RED = "Entering the Red..."
	case TO_ENDINGS = "To endings..."
	case MONTAGE = "Montage..."
	case ENTER_STAGE_LEFT = "Enter stage left..."
	case CROSS_STITCH = "Cross Stitch..."
	case SIX_DEGREES = "Six degrees..."
	case RE_ROLL_RESERVERED_1
	case RE_ROLL_RESERVERED_2
	case RE_ROLL_RESERVERED_3
	case NONE = "None"


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

	var descriptionShort: String {
		get {
			return rawValue
		}
	}

	var descriptionLong: String {
		get {
			switch self {
				case .FORESHADOWING: return "Set a thread to be the main thread for the next scene. The current scene should then start wrapping up and heading towards the next scene."
				case .TYING_OFF: return "The main thread resolves or substantially moves forward in this scene by narrative decree. This does not mean that the main thread cannot create follow-up threads."
				case .TO_CONFLICT: return "The next scene centers on a conflict of your choosing. Set the main elements of the next scene, and start heading toward them in this scene."
				case .COSTUME_CHANGE: return "An NPC drastically changes their mind, motivations, alliances, etc. for better or worse. This could be a big story reveal or a simple change of heart."
				case .KEY_GRIP: return "Set the location or general elements for the next scene. The current scene should then start wrapping up and heading towards the next scene."
				case .TO_KNOWLEDGE: return "The next scene centers on lore or investigation of your choosing. Set the main elements of the next scene, and start heading toward them in this scene."
				case .FRAMING: return "An NPC (new or pre-existing) or object becomes critical to the main thread."
				case .SET_CHANGE: return "Scene continues in another location. The current thread remains as much as makes sense."
				case .UPSTAGED: return "An NPC makes a big move. If the NPC has any motivations, plot vectors, or goals they go into overdrive."
				case .PATTERN_CHANGE: return "The main thread gets modified, drastically. Whatever direction the main thread was heading, make a hard left. Use a generator, such as Rory’s Story Cubes, tarot cards or a random Wikipedia page, as necessary."
				case .LIMELIT: return "The rest of the scene goes great for the PC’s. Assume that the majority of the questions pertaining to the main thread with regard to the scene are answered in a way that benefits the PC’s."
				case .ENTERING_THE_RED: return "Threat of danger or combat arrives. The premise of the scene gets more dangerous in a way that forces the PC’s to respond by leaving, fighting, or taking their chances."
				case .TO_ENDINGS: return "The next scene resolves or substantially moves forward a thread of your choosing. Set the main elements of the next scene, and start heading toward them in this scene."
				case .MONTAGE: return "The timeframe of the scene changes to a montage of actions set across various scenes to move forward."
				case .ENTER_STAGE_LEFT: return "A PC or NPC (new or pre-existing) arrives fresh in the scene."
				case .CROSS_STITCH: return "Choose another thread to be the main thread for the rest of the scene."
				case .SIX_DEGREES: return "A meaningful, but not always positive, connection forms between two PC’s and/or NPC’s."
				default: return "NONE"
			}
		}
	}


//	static func getDescription(situation: CRGE_UNEXPECTEDLY) -> String {
//		switch situation {
//			case FORESHADOWING: return "Set a thread to be the main thread for the next scene. The current scene should then start wrapping up and heading towards the next scene."
//			case TYING_OFF: return "The main thread resolves or substantially moves forward in this scene by narrative decree. This does not mean that the main thread cannot create follow-up threads."
//			case TO_CONFLICT: return "The next scene centers on a conflict of your choosing. Set the main elements of the next scene, and start heading toward them in this scene."
//			case COSTUME_CHANGE: return "An NPC drastically changes their mind, motivations, alliances, etc. for better or worse. This could be a big story reveal or a simple change of heart."
//			case KEY_GRIP: return "Set the location or general elements for the next scene. The current scene should then start wrapping up and heading towards the next scene."
//			case TO_KNOWLEDGE: return "The next scene centers on lore or investigation of your choosing. Set the main elements of the next scene, and start heading toward them in this scene."
//			case FRAMING: return "An NPC (new or pre-existing) or object becomes critical to the main thread."
//			case SET_CHANGE: return "Scene continues in another location. The current thread remains as much as makes sense."
//			case UPSTAGED: return "An NPC makes a big move. If the NPC has any motivations, plot vectors, or goals they go into overdrive."
//			case PATTERN_CHANGE: return "The main thread gets modified, drastically. Whatever direction the main thread was heading, make a hard left. Use a generator, such as Rory’s Story Cubes, tarot cards or a random Wikipedia page, as necessary."
//			case LIMELIT: return "The rest of the scene goes great for the PC’s. Assume that the majority of the questions pertaining to the main thread with regard to the scene are answered in a way that benefits the PC’s."
//			case ENTERING_THE_RED: return "Threat of danger or combat arrives. The premise of the scene gets more dangerous in a way that forces the PC’s to respond by leaving, fighting, or taking their chances."
//			case TO_ENDINGS: return "The next scene resolves or substantially moves forward a thread of your choosing. Set the main elements of the next scene, and start heading toward them in this scene."
//			case MONTAGE: return "The timeframe of the scene changes to a montage of actions set across various scenes to move forward."
//			case ENTER_STAGE_LEFT: return "A PC or NPC (new or pre-existing) arrives fresh in the scene."
//			case CROSS_STITCH: return "Choose another thread to be the main thread for the rest of the scene."
//			case SIX_DEGREES: return "A meaningful, but not always positive, connection forms between two PC’s and/or NPC’s."
//			default: return "NONE"
//		}
//	}

}
