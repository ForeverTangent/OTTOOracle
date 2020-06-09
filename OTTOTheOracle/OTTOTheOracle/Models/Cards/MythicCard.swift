//
//  MYTHICCard.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

// MARK: - MYTHICCard
struct MythicCard: Codable {
	var cardFile: String = "NONE"
	var forward: Bool = false
	var yesSubject: String = "NONE"
	var yesEventFocus: MythicCard_EventFocus = .NONE
	var yesAction: String = "NONE"
	var yesExceptional: Bool = false
	var yesRandomLow: Int = 0
	var yesRandomHigh: Int = 0
	var yesSceneSetupOption1_RangeLow: Int = 0
	var yesSceneSetupOption1_RangeHigh: Int = 0
	var yesSceneSetupOption1_Result: MythicCard_Result = .NONE
	var yesSceneSetupOption2_RangeLow: Int = 0
	var yesSceneSetupOption2_RangeHigh: Int = 0
	var yesSceneSetupOption2_Result: MythicCard_Result = .NONE
	var yesDescription1: String = "NONE"
	var yesDescription2: String = "NONE"
	var noSubject: String = "NONE"
	var noEventFocus: MythicCard_EventFocus = .NONE
	var noAction: String = "NONE"
	var noExceptional: Bool = false
	var noRandomLow: Int = 0
	var noRandomHigh: Int = 0
	var noSceneSetupOption1_RangeLow: Int = 0
	var noSceneSetupOption1_RangeHigh: Int = 0
	var noSceneSetupOption1_Result: MythicCard_Result = .NONE
	var noSceneSetupOption2_RangeLow: Int = 0
	var noSceneSetupOption2_RangeHigh: Int = 0
	var noSceneSetupOption2_Result: MythicCard_Result = .NONE
	var noDescription1: String = "NONE"
	var noDescription2: String = "NONE"

	enum CodingKeys: String, CodingKey {
		case cardFile = "CARD_FILE"
		case forward = "FORWARD"
		case yesSubject = "YES_SUBJECT"
		case yesEventFocus = "YES_EVENT_FOCUS"
		case yesAction = "YES_ACTION"
		case yesExceptional = "YES_EXCEPTIONAL"
		case yesRandomLow = "YES_RANDOM_LOW"
		case yesRandomHigh = "YES_RANDOM_HIGH"
		case yesSceneSetupOption1_RangeLow = "YES_SCENE_SETUP_OPTION_1_RANGE_LOW"
		case yesSceneSetupOption1_RangeHigh = "YES_SCENE_SETUP_OPTION_1_RANGE_HIGH"
		case yesSceneSetupOption1_Result = "YES_SCENE_SETUP_OPTION_1_RESULT"
		case yesSceneSetupOption2_RangeLow = "YES_SCENE_SETUP_OPTION_2_RANGE_LOW"
		case yesSceneSetupOption2_RangeHigh = "YES_SCENE_SETUP_OPTION_2_RANGE_HIGH"
		case yesSceneSetupOption2_Result = "YES_SCENE_SETUP_OPTION_2_RESULT"
		case yesDescription1 = "YES_DESCRIPTION_1"
		case yesDescription2 = "YES_DESCRIPTION_2"
		case noSubject = "NO_SUBJECT"
		case noEventFocus = "NO_EVENT_FOCUS"
		case noAction = "NO_ACTION"
		case noExceptional = "NO_EXCEPTIONAL"
		case noRandomLow = "NO_RANDOM_LOW"
		case noRandomHigh = "NO_RANDOM_HIGH"
		case noSceneSetupOption1_RangeLow = "NO_SCENE_SETUP_OPTION_1_RANGE_LOW"
		case noSceneSetupOption1_RangeHigh = "NO_SCENE_SETUP_OPTION_1_RANGE_HIGH"
		case noSceneSetupOption1_Result = "NO_SCENE_SETUP_OPTION_1_RESULT"
		case noSceneSetupOption2_RangeLow = "NO_SCENE_SETUP_OPTION_2_RANGE_LOW"
		case noSceneSetupOption2_RangeHigh = "NO_SCENE_SETUP_OPTION_2_RANGE_HIGH"
		case noSceneSetupOption2_Result = "NO_SCENE_SETUP_OPTION_2_RESULT"
		case noDescription1 = "NO_DESCRIPTION_1"
		case noDescription2 = "NO_DESCRIPTION_2"
	}
}

extension MythicCard: Comparable {
	static func < (lhs: MythicCard, rhs: MythicCard) -> Bool {
		lhs.cardFile < rhs.cardFile
	}
}


enum MythicCard_Result: String, Codable {
	case altered = "ALTERED"
	case expected = "EXPECTED"
	case interrupt = "INTERRUPT"
	case NONE = "NONE"
}

enum MythicCard_EventFocus: String, Codable {
	case ambiguousEvent = "AMBIGUOUS_EVENT"
	case closeAThread = "CLOSE_A_THREAD"
	case introduceANewNPC = "INTRODUCE_A_NEW_NPC"
	case moveAwayFromAThread = "MOVE_AWAY_FROM_A_THREAD"
	case moveTowardsAThread = "MOVE_TOWARDS_A_THREAD"
	case npcAction = "NPC_ACTION"
	case npcPositive = "NPC_POSITIVE"
	case npcNegative = "NPC_NEGATIVE"
	case pcNegative = "PC_NEGATIVE"
	case pcPositive = "PC_POSITIVE"
	case remoteEvent = "REMOTE_EVENT"
	case NONE = "NONE"
}
