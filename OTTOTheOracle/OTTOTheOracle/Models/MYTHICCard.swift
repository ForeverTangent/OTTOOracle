//
//  MYTHICCard.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

// MARK: - MYTHICCardElementb
struct MYTHICCard: Codable {
	var cardFile: String = "NONE"
	var forward: Bool = false
	private var yesSubject: String = "NONE"
	private var yesEventFocus: EventFocus = .NONE
	private var yesAction: String = "NONE"
	private var yesExceptional: Bool = false
	private var yesRandomLow: Int = 0
	private var yesRandomHigh: Int = 0
	private var yesSceneSetupOption1_RangeLow: Int = 0
	private var yesSceneSetupOption1_RangeHigh: Int = 0
	private var yesSceneSetupOption1_Result: Result = .NONE
	private var yesSceneSetupOption2_RangeLow: Int = 0
	private var yesSceneSetupOption2_RangeHigh: Int = 0
	private var yesSceneSetupOption2_Result: Result = .NONE
	private var yesDescription1: String = "NONE"
	private var yesDescription2: String = "NONE"
	private var noSubject: String = "NONE"
	private var noEventFocus: EventFocus = .NONE
	private var noAction: String = "NONE"
	private var noExceptional: Bool = false
	private var noRandomLow: Int = 0
	private var noRandomHigh: Int = 0
	private var noSceneSetupOption1_RangeLow: Int = 0
	private var noSceneSetupOption1_RangeHigh: Int = 0
	private var noSceneSetupOption1_Result: Result = .NONE
	private var noSceneSetupOption2_RangeLow: Int = 0
	private var noSceneSetupOption2_RangeHigh: Int = 0
	private var noSceneSetupOption2_Result: Result = .NONE
	private var noDescription1: String = "NONE"
	private var noDescription2: String = "NONE"

	var result: String { get { return forward ? "YES" : "NO" } }
	var subject: String { get { return forward ? yesSubject : noSubject } }
	var eventFocus: EventFocus { get { return forward ? yesEventFocus : noEventFocus } }
	var action: String { get { return forward ? yesAction : noAction } }
	var exceptional: Bool { get { return forward ? yesExceptional : noExceptional } }
	var randomLow: Int { get { return forward ? yesRandomLow : noRandomLow } }
	var randomHigh: Int { get { return forward ? yesRandomHigh : noRandomHigh } }
	var sceneSetupOption1_RangeLow: Int { get { return forward ? yesSceneSetupOption1_RangeLow : noSceneSetupOption1_RangeLow } }
	var sceneSetupOption1_RangeHigh: Int { get { return forward ? yesSceneSetupOption1_RangeHigh : noSceneSetupOption1_RangeHigh } }
	var sceneSetupOption1_Result: Result { get { return forward ? yesSceneSetupOption1_Result : noSceneSetupOption1_Result } }
	var sceneSetupOption2_RangeLow: Int { get { return forward ? yesSceneSetupOption2_RangeLow : noSceneSetupOption2_RangeLow } }
	var sceneSetupOption2_RangeHigh: Int { get { return forward ? yesSceneSetupOption2_RangeHigh : noSceneSetupOption2_RangeHigh } }
	var sceneSetupOption2_Result: Result { get { return forward ? yesSceneSetupOption2_Result : noSceneSetupOption2_Result } }
	var description1: String { get { return forward ? yesDescription1 : noDescription1 } }
	var description2: String { get { return forward ? yesDescription2 : noDescription2 } }

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

enum Result: String, Codable {
	case altered = "ALTERED"
	case expected = "EXPECTED"
	case interrupt = "INTERRUPT"
	case NONE = "NONE"
}

enum EventFocus: String, Codable {
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
