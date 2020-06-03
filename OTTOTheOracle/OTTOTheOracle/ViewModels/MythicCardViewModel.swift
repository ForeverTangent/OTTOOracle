//
//  MythicCardViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class MythicCardViewModel {

	private var mythicCard = MythicCard()

	var cardFile: String { get { return mythicCard.cardFile } }
	var forward: Bool { get { return mythicCard.forward } }

	var result: String { get { return forward ? "YES" : "NO" } }
	var subject: String { get { return forward ? mythicCard.yesSubject : mythicCard.noSubject } }
	var eventFocus: EventFocus { get { return forward ? mythicCard.yesEventFocus : mythicCard.noEventFocus } }
	var action: String { get { return forward ? mythicCard.yesAction : mythicCard.noAction } }
	var exceptional: Bool { get { return forward ? mythicCard.yesExceptional : mythicCard.noExceptional } }
	var randomLow: Int { get { return forward ? mythicCard.yesRandomLow : mythicCard.noRandomLow } }
	var randomHigh: Int { get { return forward ? mythicCard.yesRandomHigh : mythicCard.noRandomHigh } }
	var sceneSetupOption1_RangeLow: Int { get { return forward ?
		mythicCard.yesSceneSetupOption1_RangeLow :
		mythicCard.noSceneSetupOption1_RangeLow } }
	var sceneSetupOption1_RangeHigh: Int { get { return forward ?
		mythicCard.yesSceneSetupOption1_RangeHigh :
		mythicCard.noSceneSetupOption1_RangeHigh } }
	var sceneSetupOption1_Result: Result { get { return forward ?
		mythicCard.yesSceneSetupOption1_Result :
		mythicCard.noSceneSetupOption1_Result } }
	var sceneSetupOption2_RangeLow: Int { get { return forward ?
		mythicCard.yesSceneSetupOption2_RangeLow :
		mythicCard.noSceneSetupOption2_RangeLow } }
	var sceneSetupOption2_RangeHigh: Int { get { return forward ?
		mythicCard.yesSceneSetupOption2_RangeHigh :
		mythicCard.noSceneSetupOption2_RangeHigh } }
	var sceneSetupOption2_Result: Result { get { return forward ?
		mythicCard.yesSceneSetupOption2_Result :
		mythicCard.noSceneSetupOption2_Result } }
	var description1: String { get { return forward ? mythicCard.yesDescription1 : mythicCard.noDescription1 } }
	var description2: String { get { return forward ? mythicCard.yesDescription2 : mythicCard.noDescription2 } }

	init(mythicCard: MythicCard) {
		self.mythicCard = mythicCard
	}

}
