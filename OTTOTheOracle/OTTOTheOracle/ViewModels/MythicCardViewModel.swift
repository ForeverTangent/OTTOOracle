//
//  MythicCardViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import Combine

class MythicCardViewModel {

	private var mythicCard = MythicCard()

	var cardFile: String { get { return mythicCard.cardFile } }
	private var forward: Bool { get { return mythicCard.forward } }

	var result: String { get { return forward ? "YES" : "NO" } }
	var subject: String { get { return forward ? mythicCard.yesSubject : mythicCard.noSubject } }
	var eventFocus: String { get { return forward ?
		getFormattedEventFocus(mythicCard.yesEventFocus) :
		getFormattedEventFocus(mythicCard.noEventFocus) } }
	var action: String { get { return forward ? mythicCard.yesAction : mythicCard.noAction } }
	var exceptional: Bool { get { return forward ? mythicCard.yesExceptional : mythicCard.noExceptional } }
	var hasCFRandomRange: Bool { get { return getHasCFRandomRange() } }
	var randomRange: String { get { return getCFRandomRange() } }

	var sceneSetup: String { get { return getSceneSetup() } }

	private var sceneSetupOption1_RangeLow: Int { get { return forward ?
		mythicCard.yesSceneSetupOption1_RangeLow :
		mythicCard.noSceneSetupOption1_RangeLow } }
	private var sceneSetupOption1_RangeHigh: Int { get { return forward ?
		mythicCard.yesSceneSetupOption1_RangeHigh :
		mythicCard.noSceneSetupOption1_RangeHigh } }
	private var sceneSetupOption1_Result: MythicCard_Result { get { return forward ?
		mythicCard.yesSceneSetupOption1_Result :
		mythicCard.noSceneSetupOption1_Result } }
	private var sceneSetupOption2_RangeLow: Int { get { return forward ?
		mythicCard.yesSceneSetupOption2_RangeLow :
		mythicCard.noSceneSetupOption2_RangeLow } }
	private var sceneSetupOption2_RangeHigh: Int { get { return forward ?
		mythicCard.yesSceneSetupOption2_RangeHigh :
		mythicCard.noSceneSetupOption2_RangeHigh } }
	private var sceneSetupOption2_Result: MythicCard_Result { get { return forward ?
		mythicCard.yesSceneSetupOption2_Result :
		mythicCard.noSceneSetupOption2_Result } }

	var description1: String { get { return forward ? mythicCard.yesDescription1 : mythicCard.noDescription1 } }
	var description2: String { get { return forward ? mythicCard.yesDescription2 : mythicCard.noDescription2 } }

	init(mythicCard: MythicCard) {
		self.mythicCard = mythicCard
	}

	private func getFormattedEventFocus(_ eventFocus: MythicCard_EventFocus) -> String {
		return eventFocus.rawValue.replacingOccurrences(of: "_", with: " ")
	}

	private func getHasCFRandomRange() -> Bool {
		if forward  {
			return mythicCard.yesRandomLow == 0 ? false : true
		}

		return mythicCard.noRandomLow == 0 ? false : true
	}

	private func getCFRandomRange() -> String {
		let returnString = forward ?
		"\(mythicCard.yesRandomLow) - \(mythicCard.yesRandomHigh)" :
		"\(mythicCard.noRandomLow) - \(mythicCard.noRandomHigh)"

		return returnString
	}

	private func getSceneSetup() -> String {
		let sceneSetupTuple = ( forward, sceneSetupOption2_Result)
		switch sceneSetupTuple {
			case (true, .NONE):
				return "CF \(getYesSceneSetup1Range()): \(mythicCard.yesSceneSetupOption1_Result.rawValue)"
			case (true, _):
				return """
			CF \(getYesSceneSetup1Range()): \(mythicCard.yesSceneSetupOption1_Result.rawValue)
			CF \(getYesSceneSetup2Range()): \(mythicCard.yesSceneSetupOption2_Result.rawValue)
			"""
			case (false, let result2) where result2 == .NONE:
				return "CF \(getNoSceneSetup1Range()): \(mythicCard.noSceneSetupOption1_Result.rawValue)"
			case (false, let result2) where result2 != .NONE:
				return """
			CF \(getNoSceneSetup1Range()): \(mythicCard.noSceneSetupOption1_Result.rawValue)
			CF \(getNoSceneSetup2Range()): \(mythicCard.noSceneSetupOption2_Result.rawValue)
			"""
			default:
				return "∅"
		}
	}

	private func getYesSceneSetup1Range() -> String {
		if mythicCard.yesSceneSetupOption1_RangeLow == mythicCard.yesSceneSetupOption1_RangeHigh {
			return "\(mythicCard.yesSceneSetupOption1_RangeLow)"
		}
		return "\(mythicCard.yesSceneSetupOption1_RangeLow)-\(mythicCard.yesSceneSetupOption1_RangeHigh)"
	}

	private func getYesSceneSetup2Range() -> String {
		if mythicCard.yesSceneSetupOption2_RangeLow == mythicCard.yesSceneSetupOption2_RangeHigh {
			return "\(mythicCard.yesSceneSetupOption2_RangeLow)"
		}
		return "\(mythicCard.yesSceneSetupOption2_RangeLow)-\(mythicCard.yesSceneSetupOption2_RangeHigh)"
	}

	private func getNoSceneSetup1Range() -> String {
		if mythicCard.noSceneSetupOption1_RangeLow == mythicCard.noSceneSetupOption1_RangeHigh {
			return "\(mythicCard.noSceneSetupOption1_RangeLow)"
		}
		return "\(mythicCard.noSceneSetupOption1_RangeLow)-\(mythicCard.noSceneSetupOption1_RangeHigh)"
	}

	private func getNoSceneSetup2Range() -> String {
		if mythicCard.noSceneSetupOption2_RangeLow == mythicCard.noSceneSetupOption2_RangeHigh {
			return "\(mythicCard.noSceneSetupOption2_RangeLow)"
		}
		return "\(mythicCard.noSceneSetupOption2_RangeLow)-\(mythicCard.noSceneSetupOption2_RangeHigh)"
	}

}
