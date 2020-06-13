//
//  AdventureCrafterModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

class AdventureCrafterModel {

	static let subsystem = Bundle.main.bundleIdentifier!
	static let catagory = "OracleViewModel"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	static let logger = OSLog(subsystem: subsystem, category: catagory)

	var adventureModel: AdventureModel?

	func buildNewAdventureThemesModel() {
		let adventureThemeModel = AdventureThemeModelBuilder().build()
		adventureModel = AdventureModel(adventureThemes: adventureThemeModel)
	}

	func buildTurningPoint() {
		guard let theAdventureModel = adventureModel else { return }
		var turningPoints = theAdventureModel.turningPoints
		let newNurningPoint = TuringPointBuilder().build(withThemeModel: theAdventureModel.themes)
		turningPoints.append(newNurningPoint)
		theAdventureModel.turningPoints = turningPoints
	}


	func getPlotPointsForTurningPoint(index: Int) -> [ADVENTURE_PLOT_POINTS]? {
		guard
			let theAdventureModel = adventureModel,
			!theAdventureModel.turningPoints.isEmpty,
			index < theAdventureModel.turningPoints.count,
			!theAdventureModel.turningPoints[index].plotPoints.isEmpty else {
				return nil
		}

		return theAdventureModel.turningPoints[index].plotPoints
	}

	func getRandomTurningPoint() -> TuringPoint? {
		guard let theAdventureModel = adventureModel else { return nil }
		let turningPoint = TuringPointBuilder().build(withThemeModel: theAdventureModel.themes)
		return turningPoint
	}

	func buildNewAdventure() {
		buildNewAdventureThemesModel()
	}

}


class AdventureModel: Codable {
	var title: String = ""
	var notes = [String]()
	var date = Date()
	var themes: AdventureThemesModel

	var turningPoints = [TuringPoint]()

	init(adventureThemes: AdventureThemesModel) {
		self.themes = adventureThemes
	}

}


class AdventureThemesModel: Codable {

	var priorityToTheme: [Int: ADVENTURE_THEME]

	init(priorityToTheme: [Int: ADVENTURE_THEME]) {
		self.priorityToTheme = priorityToTheme
	}

	func getThemesByPriority() -> [ADVENTURE_THEME] {
		var themes = [ADVENTURE_THEME]()

		for order in 1...5 {
			if let theTheme = priorityToTheme[order] {
				themes.append(theTheme)
			}
		}
		return themes
	}


	func getRandomTheme() -> ADVENTURE_THEME {

		let d10 = Die(maxPips: 10)

		switch d10.roll() {
			case 1...4: return getTheme(number: 1)
			case 5...7: return getTheme(number: 2)
			case 8...9: return getTheme(number: 3)
			case 10:
				if Bool.random() {
					return getTheme(number: 4)
				} else {
					return getTheme(number: 5)
			}
			default: return .NONE
		}
	}

	private func getTheme(number: Int) -> ADVENTURE_THEME {
		guard let theTheme = priorityToTheme[number] else { return .NONE }
		return theTheme
	}

}

class AdventureThemeModelBuilder {

	func buildWith(_ themes: [ADVENTURE_THEME]) -> AdventureThemesModel? {
		guard themes.count == 5 else { fatalError("Need all 5") }

		let priorityToTheme: [Int: ADVENTURE_THEME] = [
			1: themes[0],
			2: themes[1],
			3: themes[2],
			4: themes[3],
			5: themes[4]
		]
		return AdventureThemesModel(priorityToTheme: priorityToTheme)
	}


	func build() -> AdventureThemesModel {
		var priorityToTheme =  [Int: ADVENTURE_THEME]()
		var priority = 1

		while priorityToTheme.count < 5 || priority < 6{
			let randomTheme = ADVENTURE_THEME.randomWeightedElement()
			if !getIfThemeIsInDictionary(priorityToTheme: priorityToTheme,
										 theme: randomTheme) {
				priorityToTheme[priority] = randomTheme
				priority += 1
			}
		}
		print(priorityToTheme)
		return AdventureThemesModel(priorityToTheme: priorityToTheme)
	}


	private func getIfThemeIsInDictionary(priorityToTheme: [Int: ADVENTURE_THEME], theme: ADVENTURE_THEME) -> Bool {
		guard priorityToTheme.values.contains(theme) else { return false }
		return true
	}

}


struct TuringPoint: Comparable, Codable {
	var order: Int = 0

	var plotLineTitle: String
	var plotLineType: ADVENTURE_PLOTLINE_TYPE
	var plotPoints: [ADVENTURE_PLOT_POINTS]

	var characters: [CharacterData]

	// MARK: - Comparable

	static func < (lhs: TuringPoint, rhs: TuringPoint) -> Bool { lhs.order < rhs.order }
	static func == (lhs: TuringPoint, rhs: TuringPoint) -> Bool { lhs.order == rhs.order }

}


class TuringPointBuilder {

	func build(withThemeModel themesModel: AdventureThemesModel) -> TuringPoint {
		return buildPlotline(withThemeModel: themesModel)
	}

	private func buildPlotline(withThemeModel themeModel: AdventureThemesModel) -> TuringPoint {

		let numberOfPlotPoints = Int.random(in: 2...5)

		var indexToPlotPoints = [ADVENTURE_PLOT_POINTS]()

		for _ in 1...numberOfPlotPoints {
			let theme = themeModel.getRandomTheme()
			let plotPoint = getPlotPointWithTheme(theme)
			indexToPlotPoints.append(plotPoint)

		}

		let turningPoint = TuringPoint(order: 0,
									   plotLineTitle: "",
									   plotLineType: .NEW_PLOTLINE,
									   plotPoints: indexToPlotPoints,
									   characters: [CharacterData]() )

		return turningPoint
	}


	private func getPlotPointWithTheme(_ theme: ADVENTURE_THEME) -> ADVENTURE_PLOT_POINTS {
		switch theme {
			case .ACTION:
				return getActionPlotPoint()
			case .TENSION:
				return getTensionPlotPoint()
			case .MYSTERY:
				return getMysteryPlotPoint()
			case .SOCIAL:
				return getSocialPlotPoint()
			case .PERSONAL:
				return getPersonalPlotPoint()
			default:
				return ADVENTURE_PLOT_POINTS.NONE
		}
	}

	private func getActionPlotPoint() -> ADVENTURE_PLOT_POINTS {
		let plotPoint = ADVENTURE_ACTION_PLOT_POINT.randomWeightedElement()

		if plotPoint == .META {
			return ADVENTURE_PLOT_POINTS.getRandomMetaPlotPoint()
		}
		return plotPoint
	}


	private func getTensionPlotPoint() -> ADVENTURE_PLOT_POINTS {
		let plotPoint = ADVENTURE_TENSION_PLOT_POINT.randomWeightedElement()

		if plotPoint == .META {
			return ADVENTURE_PLOT_POINTS.getRandomMetaPlotPoint()
		}
		return plotPoint
	}

	private func getMysteryPlotPoint() -> ADVENTURE_PLOT_POINTS {
		let plotPoint = ADVENTURE_MYSTERY_PLOT_POINT.randomWeightedElement()

		if plotPoint == .META {
			return ADVENTURE_PLOT_POINTS.getRandomMetaPlotPoint()
		}
		return plotPoint
	}

	private func getSocialPlotPoint() -> ADVENTURE_PLOT_POINTS {
		let plotPoint = ADVENTURE_SOCIAL_PLOT_POINT.randomWeightedElement()

		if plotPoint == .META {
			return ADVENTURE_PLOT_POINTS.getRandomMetaPlotPoint()
		}
		return plotPoint
	}

	private func getPersonalPlotPoint() -> ADVENTURE_PLOT_POINTS {
		let plotPoint = ADVENTURE_PERSONAL_PLOT_PLOINT.randomWeightedElement()

		if plotPoint == .META {
			return ADVENTURE_PLOT_POINTS.getRandomMetaPlotPoint()
		}
		return plotPoint
	}


}


struct CharacterData: Comparable, Equatable, Codable {
	var order: Int
	var name: String
	var trait: ADVENTURE_CHARACTER_TRAIT
	var indentity: ADVENTURE_CHARACTER_IDENTITY
	var descriptor: ADVENTURE_CHARACTER_DESCRIPTOR

	// MARK: - Comparable

	static func < (lhs: CharacterData, rhs: CharacterData) -> Bool { lhs.order < rhs.order }
	static func == (lhs: CharacterData, rhs: CharacterData) -> Bool { lhs.name == rhs.name }

}


enum ADVENTURE_PLOTLINE_TYPE: String, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_PLOTLINE_TYPE

	static var MIN: Int = 1
	static var MAX: Int = 3

	case NEW_PLOTLINE = "New Plotline"
	case DEVELOPMENT = "Development"
	case CONCLUSION = "Conclusion"
	case NONE = "None"

	static func getElementBy(value: Int) -> ADVENTURE_PLOTLINE_TYPE {
		switch value {
			case 1: return .NEW_PLOTLINE
			case 2: return .DEVELOPMENT
			case 3: return .CONCLUSION
			default: return .NONE
		}
	}

}


enum ADVENTURE_THEME: String, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_THEME

	static var MIN: Int = 1
	static var MAX: Int = 10

	case ACTION = "Action"
	case TENSION = "Tension"
	case MYSTERY = "Mystery"
	case SOCIAL = "Social"
	case PERSONAL = "Personal"
	case NONE = "None"

	static func getElementBy(value: Int) -> ADVENTURE_THEME {
		switch value {
			case 1...2: return .ACTION
			case 3...4: return .TENSION
			case 5...6: return .MYSTERY
			case 7...8: return .SOCIAL
			case 9...10: return .PERSONAL
			default: return .NONE
		}
	}

	static func getDescriptionOf(theme: ADVENTURE_THEME) -> String {
		switch theme {
			case .ACTION: return "Action Themed Plot Points focus on elements that promote instant activity in the Adventure."
			case .TENSION: return "Tension Plot Points are Adventure elements designed to make Characters nervous"
			case .MYSTERY: return "Mystery Plot Points are all about raising and answering questions."
			case .SOCIAL: return "The Social Theme is all about people interacting with each other and the presence of social institutions."
			case .PERSONAL: return "The Personal Theme is all about drawing individual Characters into the Adventure personally, with their backgrounds and personal stories having direct connections with the Plotlines of the Adventure."
			default: return "None"
		}
	}

}




enum ADVENTURE_PLOTLINES: Int, RPG_TABLE {
	typealias Result = ADVENTURE_PLOTLINES

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CHOOSE_MOST_LOGICIAL_PLOTLINE = 1
	case NEW_PLOTLINE = 2

	static func getElementBy(value: Int) -> ADVENTURE_PLOTLINES {
		switch value {
			case 1...4: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 5...8: return NEW_PLOTLINE
			case 9...12: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 13...16: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 17...20: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 21...24: return NEW_PLOTLINE
			case 25...28: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 29...32: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 33...36: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 37...40: return NEW_PLOTLINE
			case 41...44: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 45...48: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 49...52: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 53...56: return NEW_PLOTLINE
			case 57...60: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 61...64: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 65...68: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 69...72: return NEW_PLOTLINE
			case 73...76: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 77...80: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 81...84: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 85...88: return NEW_PLOTLINE
			case 89...92: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 93...96: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			case 97...100: return CHOOSE_MOST_LOGICIAL_PLOTLINE
			default:
				return CHOOSE_MOST_LOGICIAL_PLOTLINE
		}
	}
}

enum ADVENTURE_CHARACTERS: Int, RPG_TABLE {
	typealias Result = ADVENTURE_CHARACTERS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CHOOSE_MOST_LOGICAL_CHARACTER = 1
	case NEW_CHARACTER = 2

	static func getElementBy(value: Int) -> ADVENTURE_CHARACTERS {
		switch value {
			case 5...8: return  NEW_CHARACTER
			case 1...4: return  NEW_CHARACTER
			case 9...12: return  NEW_CHARACTER
			case 13...16: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 17...20: return  NEW_CHARACTER
			case 21...24: return  NEW_CHARACTER
			case 25...28: return  NEW_CHARACTER
			case 29...32: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 33...36: return  NEW_CHARACTER
			case 37...40: return  NEW_CHARACTER
			case 41...44: return  NEW_CHARACTER
			case 45...48: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 49...52: return  NEW_CHARACTER
			case 53...56: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 57...60: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 61...64: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 65...68: return  NEW_CHARACTER
			case 69...72: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 73...76: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 77...80: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 81...84: return  NEW_CHARACTER
			case 85...88: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 89...92: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 93...96: return  CHOOSE_MOST_LOGICAL_CHARACTER
			case 97...100: return  NEW_CHARACTER
			default:
				return CHOOSE_MOST_LOGICAL_CHARACTER
		}
	}
}

enum ADVENTURE_ACTION_PLOT_POINT: Int, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_PLOT_POINTS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CONCLUSION
	case NONE
	case A_CHARACTER_IS_ATTACKED_IN_A_NON_LETHAL_WAY
	case COLLATERAL_DAMAGE
	case A_CHARACTER_IS_ATTACKED_IN_A_LETHAL_WAY
	case AMBUSH
	case CATASTROPHE
	case CHARACTER_HAS_A_CLEVER_IDEA
	case SOMETHING_IS_GETTING_AWAY
	case HUNTED
	case DISTRACTION
	case A_CHARACTER_IS_ATTACKED_TO_ABDUCT
	case SOMETHING_EXOTIC
	case IMMEDIATELY
	case CHASE
	case ESCAPE
	case HEAVILY_GUARDED
	case RESCUE
	case PHYSICAL_CONTEST_OF_SKILLS
	case MASS_BATTLE
	case A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
	case VICTORY
	case TAKING_CHANCES
	case SOLE_SURVIVOR
	case STOP_THAT
	case DEFEND_OR_NOT_TO_DEFEND
	case CRASH
	case PHYSICAL_BARRIER_TO_OVERCOME
	case DOUBLE_DOWN
	case THEFT
	case DEALING_WITH_A_CALAMITY
	case SUDDEN_CESSATION
	case USED_AGAINST_THEM
	case TRAVEL_SETTING
	case FRENETIC_ACTIVITY
	case SNEAKY_BARRIER
	case A_MOMENT_OF_PEACE
	case BEAT_YOU_TO_IT
	case CONFRONTATION
	case PROTECTOR
	case CRESCENDO
	case DESTROY_THE_THING
	case META

	static func getElementBy(value: Int) -> ADVENTURE_PLOT_POINTS {
		switch value {
			case 1...8: return .CONCLUSION
			case 9...24: return .NONE
			case 25...26: return .A_CHARACTER_IS_ATTACKED_IN_A_NON_LETHAL_WAY
			case 27: return .COLLATERAL_DAMAGE
			case 28...29: return .A_CHARACTER_IS_ATTACKED_IN_A_LETHAL_WAY
			case 30...31: return .AMBUSH
			case 32: return .CATASTROPHE
			case 33: return .CHARACTER_HAS_A_CLEVER_IDEA
			case 34: return .SOMETHING_IS_GETTING_AWAY
			case 35...36: return .HUNTED
			case 37: return .DISTRACTION
			case 38...39: return .A_CHARACTER_IS_ATTACKED_TO_ABDUCT
			case 40: return .SOMETHING_EXOTIC
			case 41...42: return .IMMEDIATELY
			case 43...44: return .CHASE
			case 45...46: return .ESCAPE
			case 47...48: return .HEAVILY_GUARDED
			case 49...50: return .RESCUE
			case 51...52: return .PHYSICAL_CONTEST_OF_SKILLS
			case 53...54: return .MASS_BATTLE
			case 55: return .A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
			case 56...57: return .VICTORY
			case 58...59: return .TAKING_CHANCES
			case 60...61: return .SOLE_SURVIVOR
			case 62...63: return .STOP_THAT
			case 64...65: return .DEFEND_OR_NOT_TO_DEFEND
			case 66...67: return .CRASH
			case 68...69: return .PHYSICAL_BARRIER_TO_OVERCOME
			case 70...71: return .DOUBLE_DOWN
			case 72...73: return .THEFT
			case 74...75: return .DEALING_WITH_A_CALAMITY
			case 76...77: return .SUDDEN_CESSATION
			case 78: return .USED_AGAINST_THEM
			case 79: return .TRAVEL_SETTING
			case 80...81: return .FRENETIC_ACTIVITY
			case 82...83: return .SNEAKY_BARRIER
			case 84...85: return .A_MOMENT_OF_PEACE
			case 86...87: return .BEAT_YOU_TO_IT
			case 88...89: return .CONFRONTATION
			case 90...91: return .PROTECTOR
			case 92...93: return .CRESCENDO
			case 94...95: return .DESTROY_THE_THING
			case 96...100: return .META
			default:
				return .NONE
		}
	}

}


enum ADVENTURE_TENSION_PLOT_POINT: Int, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_PLOT_POINTS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CONCLUSION
	case NONE
	case INTO_THE_UNKNOWN
	case A_NEEDED_RESOURCE_RUNS_OUT
	case IMPENDING_DOOM
	case A_MOTIVE_FREE_CRIME
	case COLLATERAL_DAMAGE
	case SHADY_PLACES
	case DO_IT_OR_ELSE
	case REMOTE_LOCATION
	case CATASTROPHE
	case GRISLY_TONE
	case SOMETHING_IS_GETTING_AWAY
	case RETALIATION
	case A_CHARACTER_DISAPPEARS
	case HUNTED
	case BAD_DECISION
	case WANTED_BY_THE_LAW
	case SOMETHING_EXOTIC
	case IMMEDIATELY
	case BETRAYAL
	case A_CHARACTER_IS_INCAPACITATED
	case NOWHERE_TO_RUN
	case AT_NIGHT
	case A_SECRET_WEAPON
	case HEAVILY_GUARDED
	case DEAD
	case SUSPICION
	case LOSE_LOSE
	case OUT_IN_THE_OPEN
	case A_CHARACTER_IS_DIMINISHED
	case ENEMIES
	case MENACING_TONE
	case A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
	case VICTORY
	case TAKING_CHANCES
	case SOLE_SURVIVOR
	case A_PROBLEM_RETURNS
	case STUCK
	case DISARMED
	case QUIET_CATASTROPHE
	case STANDOFF
	case HIDDEN_THREAT
	case THEFT
	case A_NEED_TO_HIDE
	case FOLLOWED
	case ITS_A_TRAP
	case TIME_LIMIT
	case A_NEEDED_RESOURCE_IS_RUNNING_SHORT
	case BAD_NEWS
	case HUNKER_DOWN
	case ABANDONED
	case USED_AGAINST_THEM
	case CREEPY_TONE
	case TRAVEL_SETTING
	case A_NEW_ENEMY
	case RURAL_SETTING
	case VULNERABILITY_EXPLOITED
	case META

	static func getElementBy(value: Int) -> ADVENTURE_PLOT_POINTS {
		switch value {
			case 1...9: return .CONCLUSION
			case 9...24: return .NONE
			case 25...26: return .INTO_THE_UNKNOWN
			case 27: return .A_NEEDED_RESOURCE_RUNS_OUT
			case 28: return .IMPENDING_DOOM
			case 29: return .A_MOTIVE_FREE_CRIME
			case 30: return .COLLATERAL_DAMAGE
			case 31...32: return .SHADY_PLACES
			case 33: return .DO_IT_OR_ELSE
			case 34: return .REMOTE_LOCATION
			case 35: return .CATASTROPHE
			case 36: return .GRISLY_TONE
			case 37: return .SOMETHING_IS_GETTING_AWAY
			case 38...39: return .RETALIATION
			case 40: return .A_CHARACTER_DISAPPEARS
			case 41: return .HUNTED
			case 42: return .BAD_DECISION
			case 43: return .WANTED_BY_THE_LAW
			case 44: return .SOMETHING_EXOTIC
			case 45: return .IMMEDIATELY
			case 46: return .BETRAYAL
			case 47: return .A_CHARACTER_IS_INCAPACITATED
			case 48: return .NOWHERE_TO_RUN
			case 49...50: return .AT_NIGHT
			case 51: return .A_SECRET_WEAPON
			case 52: return .HEAVILY_GUARDED
			case 53: return .DEAD
			case 54: return .SUSPICION
			case 55: return .LOSE_LOSE
			case 56: return .OUT_IN_THE_OPEN
			case 57...58: return .A_CHARACTER_IS_DIMINISHED
			case 59: return .ENEMIES
			case 60: return .MENACING_TONE
			case 61: return .A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
			case 62: return .VICTORY
			case 63: return .TAKING_CHANCES
			case 64: return .SOLE_SURVIVOR
			case 65...66: return .A_PROBLEM_RETURNS
			case 67...68: return .STUCK
			case 69...70: return .DISARMED
			case 71: return .QUIET_CATASTROPHE
			case 72: return .STANDOFF
			case 73: return .HIDDEN_THREAT
			case 74...75: return .A_NEED_TO_HIDE
			case 76...77: return .FOLLOWED
			case 78...79: return .ITS_A_TRAP
			case 80...81: return .TIME_LIMIT
			case 82...83: return .A_NEEDED_RESOURCE_IS_RUNNING_SHORT
			case 84...85: return .BAD_NEWS
			case 86: return .HUNKER_DOWN
			case 87...88: return .ABANDONED
			case 89: return .USED_AGAINST_THEM
			case 90...91: return .CREEPY_TONE
			case 92: return .TRAVEL_SETTING
			case 93: return .A_NEW_ENEMY
			case 94: return .RURAL_SETTING
			case 95: return .VULNERABILITY_EXPLOITED
			case 96...100: return .META
			default:
				return .NONE
		}
	}

}


enum ADVENTURE_MYSTERY_PLOT_POINT: Int, RPG_TABLE, Codable {
	
	typealias Result = ADVENTURE_PLOT_POINTS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CONCLUSION
	case NONE
	case INTO_THE_UNKNOWN
	case USEFUL_INFORMATION_FROM_AN_UNKNOWN_SOURCE
	case A_MOTIVE_FREE_CRIME
	case A_CHARACTER_DISAPPEARS
	case A_RESOURCE_DISAPPEARS
	case FORTUITOUS_FIND
	case ALL_IS_REVEALED
	case USEFUL_INFORMATION_FROM_A_KNOWN_SOURCE
	case CRYPTIC_INFORMATION_FROM_A_KNOWN_SOURCE
	case LIE_DISCOVERED
	case SOMETHING_EXOTIC
	case A_CRIME_IS_COMMITTED
	case ITS_A_SECRET
	case SOMETHING_LOST_HAS_BEEN_FOUND
	case THE_OBSERVER
	case A_SECRET_WEAPON
	case LIAR
	case A_CHARACTER_ACTS_OUT_OF_CHARACTER
	case DEAD
	case MYSTERY_SOLVED
	case SECRET_INFORMATION_LEAKED
	case SUSPICION
	case EVIDENCE
	case THE_PLOT_THICKENS
	case DUBIOUS_RATIONALE
	case A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
	case CRYPTIC_INFORMATION_FROM_AN_UNKNOWN_SOURCE
	case A_COMMON_THREAD
	case NOT_THEIR_MASTER
	case THE_SECRET_TO_THE_POWER
	case HIDDEN_AGENDA
	case AN_OBJECT_OF_UNKNOWN_USE_IS_FOUND
	case CLEAR_THE_RECORD
	case FRAMED
	case AN_IMPROBABLE_CRIME
	case THE_HIDDEN_HAND
	case FIND_IT_OR_ELSE
	case TRAVEL_SETTING
	case AN_OLD_DEAL
	case A_MYSTERIOUS_NEW_PERSON
	case RURAL_SETTING
	case SOMEONE_IS_WHERE_THEY_SHOULD_NOT_BE
	case VULNERABILITY_EXPLOITED
	case FRAUD
	case BEAT_YOU_TO_IT
	case CONSPIRACY_THEORY
	case AN_OPPOSING_STORY
	case META

	static func getElementBy(value: Int) -> ADVENTURE_PLOT_POINTS {
		switch value {
//			case 1...8: return .CONCLUSION
//			case 9...24: return .NONE
//			case 25...26: return .INTO_THE_UNKNOWN
//			case 27...28: return .USEFUL_INFORMATION_FROM_AN_UNKNOWN_SOURCE
//			case 29...30: return .A_MOTIVE_FREE_CRIME
//			case 31...32: return .A_CHARACTER_DISAPPEARS
//			case 33: return .THIS_ISNT_WORKING
//			case 34...35: return .A_RESOURCE_DISAPPEARS
//			case 36: return .FORTUITOUS_FIND
//			case 37: return .ALL_IS_REVEALED
//			case 38...29: return .USEFUL_INFORMATION_FROM_A_KNOWN_SOURCE
//			case 40: return .CRYPTIC_INFORMATION_FROM_A_KNOWN_SOURCE
//			case 41...42: return .LIE_DISCOVERED
//			case 43: return .SOMETHING_EXOTIC
//			case 44...45: return .A_CRIME_IS_COMMITTED
//			case 46...47: return .ITS_A_SECRET
//			case 48: return .SOMETHING_LOST_HAS_BEEN_FOUND
//			case 49: return .THE_OBSERVER
//			case 50: return .A_SECRET_WEAPON
//			case 51...52: return .LIAR
//			case 53: return .A_CHARACTER_ACTS_OUT_OF_CHARACTER
//			case 54: return .DEAD
//			case 55...56: return .MYSTERY_SOLVED
//			case 57: return .SECRET_INFORMATION_LEAKED
//			case 58...59: return .SUSPICION
//			case 60...61: return .EVIDENCE
//			case 62...63: return .THE_PLOT_THICKENS
//			case 64: return .DUBIOUS_RATIONALE
//			case 65: return .A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
//			case 66...67: return .CRYPTIC_INFORMATION_FROM_AN_UNKNOWN_SOURCE
//			case 68...69: return .A_COMMON_THREAD
//			case 70: return .NOT_THEIR_MASTER
//			case 71...72: return .THE_SECRET_TO_THE_POWER
//			case 73...74: return .HIDDEN_AGENDA
//			case 75: return .AN_OBJECT_OF_UNKNOWN_USE_IS_FOUND
//			case 76: return .CLEAR_THE_RECORD
//			case 77: return .FRAMED
//			case 78: return .AN_IMPROBABLE_CRIME
//			case 79...80: return .THE_HIDDEN_HAND
//			case 81...82: return .FIND_IT_OR_ELSE
//			case 83: return .TRAVEL_SETTING
//			case 84: return .AN_OLD_DEAL
//			case 85: return .A_MYSTERIOUS_NEW_PERSON
//			case 86: return .RURAL_SETTING
//			case 87...88: return .SOMEONE_IS_WHERE_THEY_SHOULD_NOT_BE
//			case 89: return .VULNERABILITY_EXPLOITED
//			case 90...91: return .FRAUD
//			case 92...93: return .BEAT_YOU_TO_IT
//			case 94: return .CONSPIRACY_THEORY
//			case 95: return .AN_OPPOSING_STORY
//			case 96...100: return .META
			default:
				return .NONE
		}
	}
}

enum ADVENTURE_SOCIAL_PLOT_POINT: Int, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_PLOT_POINTS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CONCLUSION
	case NONE
	case OUTCAST
	case SOLD
	case RETALIATION
	case A_HIGH_ENERGY_GATHERING
	case A_RARE_OR_UNIQUE_SOCIAL_GATHERING
	case AN_ORGANIZATION
	case PEOPLE_BEHAVING_BADLY
	case FAME
	case SCAPEGOAT
	case THE_OBSERVER
	case LIAR
	case HEADQUARTERS
	case A_COMMON_SOCIAL_GATHERING
	case LIGHT_URBAN_SETTING
	case A_WORK_RELATED_GATHERING
	case SUSPICION
	case ENEMIES
	case DENSE_URBAN_SETTING
	case A_GROUP_IS_IN_TROUBLE
	case TOKEN_RESPONSE
	case NOT_THEIR_MASTER
	case PUBLIC_LOCATION
	case THE_LEADER
	case SAVIOR
	case REINFORCEMENTS
	case GOVERNMENT
	case INJUSTICE
	case A_CELEBRATION
	case STANDOFF
	case RELIGION
	case INNOCENCE
	case PREPARATION
	case A_MEETING_OF_MINDS
	case ORGANIZATIONS_IN_CONFLICT
	case POWERFUL_PERSON
	case TRAVEL_SETTING
	case ESCORT_DUTY
	case AN_OLD_DEAL
	case ALLIANCE
	case POWER_OVER_OTHERS
	case RURAL_SETTING
	case CORRUPTION
	case ITS_BUSINESS
	case JUST_CAUSE_GONE_AWRY
	case CONFRONTATION
	case ARGUMENT
	case SOCIAL_TENSION_SET_TO_BOILING
	case SERVANT
	case META

	static func getElementBy(value: Int) -> ADVENTURE_PLOT_POINTS {
		switch value {
			case 1...8: return .CONCLUSION
			case 9...24: return .NONE
			case 25...26: return .OUTCAST
			case 27...28: return .SOLD
			case 29...30: return .RETALIATION
			case 31: return .A_HIGH_ENERGY_GATHERING
			case 32: return .A_RARE_OR_UNIQUE_SOCIAL_GATHERING
			case 33...34: return .AN_ORGANIZATION
			case 35: return .PEOPLE_BEHAVING_BADLY
			case 36: return .FAME
			case 37: return .SCAPEGOAT
			case 38: return .THE_OBSERVER
			case 39: return .LIAR
			case 40...41: return .HEADQUARTERS
			case 42...43: return .A_COMMON_SOCIAL_GATHERING
			case 44...45: return .LIGHT_URBAN_SETTING
			case 46...47: return .A_WORK_RELATED_GATHERING
			case 48: return .SUSPICION
			case 49: return .ENEMIES
			case 50...51: return .DENSE_URBAN_SETTING
			case 52...52: return .A_GROUP_IS_IN_TROUBLE
			case 54: return .TOKEN_RESPONSE
			case 55: return .NOT_THEIR_MASTER
			case 56...57: return .PUBLIC_LOCATION
			case 58...59: return .THE_LEADER
			case 60...61: return .SAVIOR
			case 62...63: return .REINFORCEMENTS
			case 64...65: return .GOVERNMENT
			case 66...67: return .INJUSTICE
			case 68...69: return .A_CELEBRATION
			case 70: return .STANDOFF
			case 71: return .RELIGION
			case 72: return .INNOCENCE
			case 73...74: return .PREPARATION
			case 75: return .A_MEETING_OF_MINDS
			case 76: return .ORGANIZATIONS_IN_CONFLICT
			case 77: return .POWERFUL_PERSON
			case 78: return .TRAVEL_SETTING
			case 79: return .ESCORT_DUTY
			case 80: return .AN_OLD_DEAL
			case 81...82: return .ALLIANCE
			case 83...84: return .POWER_OVER_OTHERS
			case 85: return .RURAL_SETTING
			case 86...87: return .CORRUPTION
			case 88...89: return .ITS_BUSINESS
			case 90: return .JUST_CAUSE_GONE_AWRY
			case 91: return .CONFRONTATION
			case 92...93: return .ARGUMENT
			case 94: return .SOCIAL_TENSION_SET_TO_BOILING
			case 95: return .SERVANT
			case 96...100: return .META
			default:
				return .NONE
		}
	}
}


enum ADVENTURE_PERSONAL_PLOT_PLOINT: Int, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_PLOT_POINTS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CONCLUSION
	case NONE
	case PERSUASION
	case DO_IT_OR_ELSE
	case RETALIATION
	case BAD_DECISION
	case ILL_WILL
	case WANTED_BY_THE_LAW
	case IT_IS_YOUR_DUTY
	case CHARACTER_CONNECTION_SEVERED
	case HUMILIATION
	case BETRAYAL
	case A_CHARACTER_IS_INCAPACITATED
	case THE_OBSERVER
	case HOME_SWEET_HOME
	case HEADQUARTERS
	case FAMILY_MATTERS
	case A_FIGURE_FROM_THE_PAST
	case A_CHARACTER_IS_DIMINISHED
	case ENEMIES
	case DOING_THE_RIGHT_THING
	case AT_YOUR_MERCY
	case FALL_FROM_POWER
	case HELP_IS_OFFERED_FOR_A_PRICE
	case PRIZED_POSSESSION
	case DISARMED
	case ITS_ALL_ABOUT_YOU
	case CHARACTER_CONNECTION
	case INNOCENCE
	case WILLING_TO_TALK
	case CHARACTER_HARM
	case FRAMED
	case PREPARATION
	case UNTOUCHABLE
	case BRIBE
	case CHARACTER_ASSISTANCE
	case ASKING_FOR_HELP
	case WELCOME_TO_THE_PLOT
	case LIKEABLE
	case THE_PROMISE_OF_REWARD
	case EXPERT_KNOWLEDGE
	case A_FOCUS_ON_THE_MUNDANE
	case RUN_AWAY
	case PROTECTOR
	case SERVANT
	case META
	case META_CHARACTER_EXITS_THE_ADVENTURE
	case META_CHARACTER_RETURNS
	case META_CHARACTER_STEPS_UP
	case META_CHARACTER_STEPS_DOWN
	case META_CHARACTER_DOWNGRADE
	case META_CHARACTER_UPGRADE
	case META_PLOTLINE_COMBO

	static func getElementBy(value: Int) -> ADVENTURE_PLOT_POINTS {
		switch value {
			case 1...8:  return .CONCLUSION
			case 9...24:  return .NONE
			case 25...26:  return .PERSUASION
			case 27:  return .DO_IT_OR_ELSE
			case 28:  return .RETALIATION
			case 29:  return .BAD_DECISION
			case 30...31:  return .ILL_WILL
			case 32...33:  return .WANTED_BY_THE_LAW
			case 34...35:  return .IT_IS_YOUR_DUTY
			case 36...37:  return .CHARACTER_CONNECTION_SEVERED
			case 38:  return .HUMILIATION
			case 39...40:  return .BETRAYAL
			case 41...42:  return .A_CHARACTER_IS_INCAPACITATED
			case 43:  return .THE_OBSERVER
			case 44...45:  return .HOME_SWEET_HOME
			case 46:  return .HEADQUARTERS
			case 47...48:  return .FAMILY_MATTERS
			case 49:  return .A_FIGURE_FROM_THE_PAST
			case 50...51:  return .A_CHARACTER_IS_DIMINISHED
			case 52...53:  return .ENEMIES
			case 54:  return .DOING_THE_RIGHT_THING
			case 55...56:  return .AT_YOUR_MERCY
			case 57...58:  return .FALL_FROM_POWER
			case 59...60:  return .HELP_IS_OFFERED_FOR_A_PRICE
			case 61...62:  return .PRIZED_POSSESSION
			case 63:  return .DISARMED
			case 64...65:  return .ITS_ALL_ABOUT_YOU
			case 66...67:  return .CHARACTER_CONNECTION
			case 68:  return .INNOCENCE
			case 69...70:  return .WILLING_TO_TALK
			case 71...72:  return .CHARACTER_HARM
			case 73:  return .FRAMED
			case 74...75:  return .PREPARATION
			case 76:  return .FRIEND_FOCUS
			case 77:  return .UNTOUCHABLE
			case 78:  return .BRIBE
			case 79...80:  return .CHARACTER_ASSISTANCE
			case 81...82:  return .ASKING_FOR_HELP
			case 83:  return .WELCOME_TO_THE_PLOT
			case 84:  return .LIKEABLE
			case 85...86:  return .THE_PROMISE_OF_REWARD
			case 87:  return .EXPERT_KNOWLEDGE
			case 88...89:  return .A_FOCUS_ON_THE_MUNDANE
			case 90...91:  return .RUN_AWAY
			case 92...93:  return .PROTECTOR
			case 94...95:  return .SERVANT
			case 96...100:  return .META
			default:
				return .NONE
		}
	}
}


enum ADVENTURE_PLOT_POINTS: String, Codable {
	case CONCLUSION
	case NONE
	case INTO_THE_UNKNOWN
	case A_CHARACTER_IS_ATTACKED_IN_A_NON_LETHAL_WAY
	case A_NEEDED_RESOURCE_RUNS_OUT
	case USEFUL_INFORMATION_FROM_AN_UNKNOWN_SOURCE
	case IMPENDING_DOOM
	case OUTCAST
	case PERSUASION
	case A_MOTIVE_FREE_CRIME
	case COLLATERAL_DAMAGE
	case SHADY_PLACES
	case A_CHARACTER_IS_ATTACKED_IN_A_LETHAL_WAY
	case DO_IT_OR_ELSE
	case REMOTE_LOCATION
	case AMBUSH
	case SOLD
	case CATASTROPHE
	case GRISLY_TONE
	case CHARACTER_HAS_A_CLEVER_IDEA
	case SOMETHING_IS_GETTING_AWAY
	case RETALIATION
	case A_CHARACTER_DISAPPEARS
	case HUNTED
	case A_HIGH_ENERGY_GATHERING
	case A_RARE_OR_UNIQUE_SOCIAL_GATHERING
	case BAD_DECISION
	case THIS_ISNT_WORKING
	case DISTRACTION
	case ILL_WILL
	case AN_ORGANIZATION
	case WANTED_BY_THE_LAW
	case A_RESOURCE_DISAPPEARS
	case IT_IS_YOUR_DUTY
	case FORTUITOUS_FIND
	case CHARACTER_CONNECTION_SEVERED
	case ALL_IS_REVEALED
	case HUMILIATION
	case PEOPLE_BEHAVING_BADLY
	case USEFUL_INFORMATION_FROM_A_KNOWN_SOURCE
	case CRYPTIC_INFORMATION_FROM_A_KNOWN_SOURCE
	case LIE_DISCOVERED
	case A_CHARACTER_IS_ATTACKED_TO_ABDUCT
	case SOMETHING_EXOTIC
	case IMMEDIATELY
	case FAME
	case CHASE
	case BETRAYAL
	case A_CRIME_IS_COMMITTED
	case A_CHARACTER_IS_INCAPACITATED
	case ITS_A_SECRET
	case SOMETHING_LOST_HAS_BEEN_FOUND
	case SCAPEGOAT
	case NOWHERE_TO_RUN
	case AT_NIGHT
	case THE_OBSERVER
	case ESCAPE
	case A_SECRET_WEAPON
	case HEAVILY_GUARDED
	case RESCUE
	case LIAR
	case HOME_SWEET_HOME
	case A_CHARACTER_ACTS_OUT_OF_CHARACTER
	case HEADQUARTERS
	case PHYSICAL_CONTEST_OF_SKILLS
	case DEAD
	case A_COMMON_SOCIAL_GATHERING
	case LIGHT_URBAN_SETTING
	case MYSTERY_SOLVED
	case A_WORK_RELATED_GATHERING
	case FAMILY_MATTERS
	case SECRET_INFORMATION_LEAKED
	case SUSPICION
	case LOSE_LOSE
	case A_FIGURE_FROM_THE_PAST
	case MASS_BATTLE
	case OUT_IN_THE_OPEN
	case EVIDENCE
	case A_CHARACTER_IS_DIMINISHED
	case THE_PLOT_THICKENS
	case ENEMIES
	case DUBIOUS_RATIONALE
	case MENACING_TONE
	case A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
	case DENSE_URBAN_SETTING
	case DOING_THE_RIGHT_THING
	case VICTORY
	case TAKING_CHANCES
	case A_GROUP_IS_IN_TROUBLE
	case SOLE_SURVIVOR
	case TOKEN_RESPONSE
	case CRYPTIC_INFORMATION_FROM_AN_UNKNOWN_SOURCE
	case A_COMMON_THREAD
	case A_PROBLEM_RETURNS
	case STUCK
	case AT_YOUR_MERCY
	case STOP_THAT
	case NOT_THEIR_MASTER
	case FALL_FROM_POWER
	case HELP_IS_OFFERED_FOR_A_PRICE
	case PUBLIC_LOCATION
	case THE_LEADER
	case PRIZED_POSSESSION
	case SAVIOR
	case DISARMED
	case THE_SECRET_TO_THE_POWER
	case HIDDEN_AGENDA
	case DEFEND_OR_NOT_TO_DEFEND
	case CRASH
	case REINFORCEMENTS
	case GOVERNMENT
	case PHYSICAL_BARRIER_TO_OVERCOME
	case INJUSTICE
	case QUIET_CATASTROPHE
	case AN_OBJECT_OF_UNKNOWN_USE_IS_FOUND
	case ITS_ALL_ABOUT_YOU
	case A_CELEBRATION
	case STANDOFF
	case DOUBLE_DOWN
	case HIDDEN_THREAT
	case CHARACTER_CONNECTION
	case RELIGION
	case INNOCENCE
	case CLEAR_THE_RECORD
	case WILLING_TO_TALK
	case THEFT
	case CHARACTER_HARM
	case A_NEED_TO_HIDE
	case FOLLOWED
	case FRAMED
	case PREPARATION
	case AN_IMPROBABLE_CRIME
	case FRIEND_FOCUS
	case UNTOUCHABLE
	case BRIBE
	case DEALING_WITH_A_CALAMITY
	case SUDDEN_CESSATION
	case ITS_A_TRAP
	case A_MEETING_OF_MINDS
	case TIME_LIMIT
	case THE_HIDDEN_HAND
	case A_NEEDED_RESOURCE_IS_RUNNING_SHORT
	case ORGANIZATIONS_IN_CONFLICT
	case BAD_NEWS
	case CHARACTER_ASSISTANCE
	case ASKING_FOR_HELP
	case HUNKER_DOWN
	case ABANDONED
	case FIND_IT_OR_ELSE
	case USED_AGAINST_THEM
	case POWERFUL_PERSON
	case CREEPY_TONE
	case WELCOME_TO_THE_PLOT
	case TRAVEL_SETTING
	case ESCORT_DUTY
	case AN_OLD_DEAL
	case A_NEW_ENEMY
	case ALLIANCE
	case POWER_OVER_OTHERS
	case A_MYSTERIOUS_NEW_PERSON
	case FRENETIC_ACTIVITY
	case RURAL_SETTING
	case LIKEABLE
	case SOMEONE_IS_WHERE_THEY_SHOULD_NOT_BE
	case SNEAKY_BARRIER
	case CORRUPTION
	case VULNERABILITY_EXPLOITED
	case THE_PROMISE_OF_REWARD
	case FRAUD
	case ITS_BUSINESS
	case JUST_CAUSE_GONE_AWRY
	case EXPERT_KNOWLEDGE
	case A_MOMENT_OF_PEACE
	case A_FOCUS_ON_THE_MUNDANE
	case RUN_AWAY
	case BEAT_YOU_TO_IT
	case CONFRONTATION
	case ARGUMENT
	case SOCIAL_TENSION_SET_TO_BOILING
	case PROTECTOR
	case CRESCENDO
	case DESTROY_THE_THING
	case CONSPIRACY_THEORY
	case SERVANT
	case AN_OPPOSING_STORY
	case META
	case META_CHARACTER_EXITS_THE_ADVENTURE
	case META_CHARACTER_RETURNS
	case META_CHARACTER_STEPS_UP
	case META_CHARACTER_STEPS_DOWN
	case META_CHARACTER_DOWNGRADE
	case META_CHARACTER_UPGRADE
	case META_PLOTLINE_COMBO

	
	static func getRandomMetaPlotPoint() -> ADVENTURE_PLOT_POINTS {
		let number = Int.random(in: 1...100)

		switch number {
			case 1...18: return .META_CHARACTER_EXITS_THE_ADVENTURE
			case 19...27: return .META_CHARACTER_RETURNS
			case 28...36: return .META_CHARACTER_STEPS_UP
			case 37...55: return .META_CHARACTER_STEPS_DOWN
			case 56...73: return .META_CHARACTER_DOWNGRADE
			case 74...82: return .META_CHARACTER_UPGRADE
			case 83...100: return .META_PLOTLINE_COMBO
			default: return .NONE
		}
	}

	static func getShortDescriptionForPlotPloint(_ plotPoint: ADVENTURE_PLOT_POINTS) -> String {

		switch plotPoint {
			case .CONCLUSION: return "Conclusion"
			case .NONE: return "None"
			case .INTO_THE_UNKNOWN: return "Into The Unknown"
			case .A_CHARACTER_IS_ATTACKED_IN_A_NON_LETHAL_WAY: return "A Character Is Attacked In A Non Lethal Way"
			case .A_NEEDED_RESOURCE_RUNS_OUT: return "A Needed Resource Runs Out"
			case .USEFUL_INFORMATION_FROM_AN_UNKNOWN_SOURCE: return "Useful Information From An Unknown Source"
			case .IMPENDING_DOOM: return "Impending Doom"
			case .OUTCAST: return "Outcast"
			case .PERSUASION: return "Persuasion"
			case .A_MOTIVE_FREE_CRIME: return "A Motive Free Crime"
			case .COLLATERAL_DAMAGE: return "Collateral Damage"
			case .SHADY_PLACES: return "Shady Places"
			case .A_CHARACTER_IS_ATTACKED_IN_A_LETHAL_WAY: return "A Character Is Attacked In A Lethal Way"
			case .DO_IT_OR_ELSE: return "Do It Or Else"
			case .REMOTE_LOCATION: return "Remote Location"
			case .AMBUSH: return "Ambush"
			case .SOLD: return "Sold"
			case .CATASTROPHE: return "Catastrophe"
			case .GRISLY_TONE: return "Grisly Tone"
			case .CHARACTER_HAS_A_CLEVER_IDEA: return "Character Has A Clever Idea"
			case .SOMETHING_IS_GETTING_AWAY: return "Something Is Getting Away"
			case .RETALIATION: return "Retaliation"
			case .A_CHARACTER_DISAPPEARS: return "A Character Disappears"
			case .HUNTED: return "Hunted"
			case .A_HIGH_ENERGY_GATHERING: return "A High Energy Gathering"
			case .A_RARE_OR_UNIQUE_SOCIAL_GATHERING: return "A Rare Or Unique Social Gathering"
			case .BAD_DECISION: return "Bad Decision"
			case .THIS_ISNT_WORKING: return "This Isnt Working"
			case .DISTRACTION: return "Distraction"
			case .ILL_WILL: return "Ill Will"
			case .AN_ORGANIZATION: return "An Organization"
			case .WANTED_BY_THE_LAW: return "Wanted By The Law"
			case .A_RESOURCE_DISAPPEARS: return "A Resource Disappears"
			case .IT_IS_YOUR_DUTY: return "It Is Your Duty"
			case .FORTUITOUS_FIND: return "Fortuitous Find"
			case .CHARACTER_CONNECTION_SEVERED: return "Character Connection Severed"
			case .ALL_IS_REVEALED: return "All Is Revealed"
			case .HUMILIATION: return "Humiliation"
			case .PEOPLE_BEHAVING_BADLY: return "People Behaving Badly"
			case .USEFUL_INFORMATION_FROM_A_KNOWN_SOURCE: return "Useful Information From A Known Source"
			case .CRYPTIC_INFORMATION_FROM_A_KNOWN_SOURCE: return "Cryptic Information From A Known Source"
			case .LIE_DISCOVERED: return "Lie Discovered"
			case .A_CHARACTER_IS_ATTACKED_TO_ABDUCT: return "A Character Is Attacked To Abduct"
			case .SOMETHING_EXOTIC: return "Something Exotic"
			case .IMMEDIATELY: return "Immediately"
			case .FAME: return "Fame"
			case .CHASE: return "Chase"
			case .BETRAYAL: return "Betrayal"
			case .A_CRIME_IS_COMMITTED: return "A Crime Is Committed"
			case .A_CHARACTER_IS_INCAPACITATED: return "A Character Is Incapacitated"
			case .ITS_A_SECRET: return "Its A Secret"
			case .SOMETHING_LOST_HAS_BEEN_FOUND: return "Something Lost Has Been Found"
			case .SCAPEGOAT: return "Scapegoat"
			case .NOWHERE_TO_RUN: return "Nowhere To Run"
			case .AT_NIGHT: return "At Night"
			case .THE_OBSERVER: return "The Observer"
			case .ESCAPE: return "Escape"
			case .A_SECRET_WEAPON: return "A Secret Weapon"
			case .HEAVILY_GUARDED: return "Heavily Guarded"
			case .RESCUE: return "Rescue"
			case .LIAR: return "Liar"
			case .HOME_SWEET_HOME: return "Home Sweet Home"
			case .A_CHARACTER_ACTS_OUT_OF_CHARACTER: return "A Character Acts Out Of Character"
			case .HEADQUARTERS: return "Headquarters"
			case .PHYSICAL_CONTEST_OF_SKILLS: return "Physical Contest Of Skills"
			case .DEAD: return "Dead"
			case .A_COMMON_SOCIAL_GATHERING: return "A Common Social Gathering"
			case .LIGHT_URBAN_SETTING: return "Light Urban Setting"
			case .MYSTERY_SOLVED: return "Mystery Solved"
			case .A_WORK_RELATED_GATHERING: return "A Work Related Gathering"
			case .FAMILY_MATTERS: return "Family Matters"
			case .SECRET_INFORMATION_LEAKED: return "Secret Information Leaked"
			case .SUSPICION: return "Suspicion"
			case .LOSE_LOSE: return "Lose Lose"
			case .A_FIGURE_FROM_THE_PAST: return "A Figure From The Past"
			case .MASS_BATTLE: return "Mass Battle"
			case .OUT_IN_THE_OPEN: return "Out In The Open"
			case .EVIDENCE: return "Evidence"
			case .A_CHARACTER_IS_DIMINISHED: return "A Character Is Diminished"
			case .THE_PLOT_THICKENS: return "The Plot Thickens"
			case .ENEMIES: return "Enemies"
			case .DUBIOUS_RATIONALE: return "Dubious Rationale"
			case .MENACING_TONE: return "Menacing Tone"
			case .A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL: return "A Crucial Life Support System Begins To Fail"
			case .DENSE_URBAN_SETTING: return "Dense Urban Setting"
			case .DOING_THE_RIGHT_THING: return "Doing The Right Thing"
			case .VICTORY: return "Victory"
			case .TAKING_CHANCES: return "Taking Chances"
			case .A_GROUP_IS_IN_TROUBLE: return "A Group Is In Trouble"
			case .SOLE_SURVIVOR: return "Sole Survivor"
			case .TOKEN_RESPONSE: return "Token Response"
			case .CRYPTIC_INFORMATION_FROM_AN_UNKNOWN_SOURCE: return "Cryptic Information From An Unknown Source"
			case .A_COMMON_THREAD: return "A Common Thread"
			case .A_PROBLEM_RETURNS: return "A Problem Returns"
			case .STUCK: return "Stuck"
			case .AT_YOUR_MERCY: return "At Your Mercy"
			case .STOP_THAT: return "Stop That"
			case .NOT_THEIR_MASTER: return "Not Their Master"
			case .FALL_FROM_POWER: return "Fall From Power"
			case .HELP_IS_OFFERED_FOR_A_PRICE: return "Help Is Offered For A Price"
			case .PUBLIC_LOCATION: return "Public Location"
			case .THE_LEADER: return "The Leader"
			case .PRIZED_POSSESSION: return "Prized Possession"
			case .SAVIOR: return "Savior"
			case .DISARMED: return "Disarmed"
			case .THE_SECRET_TO_THE_POWER: return "The Secret To The Power"
			case .HIDDEN_AGENDA: return "Hidden Agenda"
			case .DEFEND_OR_NOT_TO_DEFEND: return "Defend Or Not To Defend"
			case .CRASH: return "Crash"
			case .REINFORCEMENTS: return "Reinforcements"
			case .GOVERNMENT: return "Government"
			case .PHYSICAL_BARRIER_TO_OVERCOME: return "Physical Barrier To Overcome"
			case .INJUSTICE: return "Injustice"
			case .QUIET_CATASTROPHE: return "Quiet Catastrophe"
			case .AN_OBJECT_OF_UNKNOWN_USE_IS_FOUND: return "An Object Of Unknown Use Is Found"
			case .ITS_ALL_ABOUT_YOU: return "Its All About You"
			case .A_CELEBRATION: return "A Celebration"
			case .STANDOFF: return "Standoff"
			case .DOUBLE_DOWN: return "Double Down"
			case .HIDDEN_THREAT: return "Hidden Threat"
			case .CHARACTER_CONNECTION: return "Character Connection"
			case .RELIGION: return "Religion"
			case .INNOCENCE: return "Innocence"
			case .CLEAR_THE_RECORD: return "Clear The Record"
			case .WILLING_TO_TALK: return "Willing To Talk"
			case .THEFT: return "Theft"
			case .CHARACTER_HARM: return "Character Harm"
			case .A_NEED_TO_HIDE: return "A Need To Hide"
			case .FOLLOWED: return "Followed"
			case .FRAMED: return "Framed"
			case .PREPARATION: return "Preparation"
			case .AN_IMPROBABLE_CRIME: return "An Improbable Crime"
			case .FRIEND_FOCUS: return "Friend Focus"
			case .UNTOUCHABLE: return "Untouchable"
			case .BRIBE: return "Bribe"
			case .DEALING_WITH_A_CALAMITY: return "Dealing With A Calamity"
			case .SUDDEN_CESSATION: return "Sudden Cessation"
			case .ITS_A_TRAP: return "Its A Trap"
			case .A_MEETING_OF_MINDS: return "A Meeting Of Minds"
			case .TIME_LIMIT: return "Time Limit"
			case .THE_HIDDEN_HAND: return "The Hidden Hand"
			case .A_NEEDED_RESOURCE_IS_RUNNING_SHORT: return "A Needed Resource Is Running Short"
			case .ORGANIZATIONS_IN_CONFLICT: return "Organizations In Conflict"
			case .BAD_NEWS: return "Bad News"
			case .CHARACTER_ASSISTANCE: return "Character Assistance"
			case .ASKING_FOR_HELP: return "Asking For Help"
			case .HUNKER_DOWN: return "Hunker Down"
			case .ABANDONED: return "Abandoned"
			case .FIND_IT_OR_ELSE: return "Find It Or Else"
			case .USED_AGAINST_THEM: return "Used Against Them"
			case .POWERFUL_PERSON: return "Powerful Person"
			case .CREEPY_TONE: return "Creepy Tone"
			case .WELCOME_TO_THE_PLOT: return "Welcome To The Plot"
			case .TRAVEL_SETTING: return "Travel Setting"
			case .ESCORT_DUTY: return "Escort Duty"
			case .AN_OLD_DEAL: return "An Old Deal"
			case .A_NEW_ENEMY: return "A New Enemy"
			case .ALLIANCE: return "Alliance"
			case .POWER_OVER_OTHERS: return "Power Over Others"
			case .A_MYSTERIOUS_NEW_PERSON: return "A Mysterious New Person"
			case .FRENETIC_ACTIVITY: return "Frenetic Activity"
			case .RURAL_SETTING: return "Rural Setting"
			case .LIKEABLE: return "Likeable"
			case .SOMEONE_IS_WHERE_THEY_SHOULD_NOT_BE: return "Someone Is Where They Should Not Be"
			case .SNEAKY_BARRIER: return "Sneaky Barrier"
			case .CORRUPTION: return "Corruption"
			case .VULNERABILITY_EXPLOITED: return "Vulnerability Exploited"
			case .THE_PROMISE_OF_REWARD: return "The Promise Of Reward"
			case .FRAUD: return "Fraud"
			case .ITS_BUSINESS: return "Its Business"
			case .JUST_CAUSE_GONE_AWRY: return "Just Cause Gone Awry"
			case .EXPERT_KNOWLEDGE: return "Expert Knowledge"
			case .A_MOMENT_OF_PEACE: return "A Moment Of Peace"
			case .A_FOCUS_ON_THE_MUNDANE: return "A Focus On The Mundane"
			case .RUN_AWAY: return "Run Away"
			case .BEAT_YOU_TO_IT: return "Beat You To It"
			case .CONFRONTATION: return "Confrontation"
			case .ARGUMENT: return "Argument"
			case .SOCIAL_TENSION_SET_TO_BOILING: return "Social Tension Set To Boiling"
			case .PROTECTOR: return "Protector"
			case .CRESCENDO: return "Crescendo"
			case .DESTROY_THE_THING: return "Destroy The Thing"
			case .CONSPIRACY_THEORY: return "Conspiracy Theory"
			case .SERVANT: return "Servant"
			case .AN_OPPOSING_STORY: return "An Opposing Story"
			case .META: return "Meta"
			case .META_CHARACTER_EXITS_THE_ADVENTURE: return "(Meta) Character exits the adventure."
			case .META_CHARACTER_RETURNS: return "(Meta) Character returns to the adventure."
			case .META_CHARACTER_STEPS_UP: return "(Meta) Character steps up in the adventure."
			case .META_CHARACTER_STEPS_DOWN: return "(Meta) Character steps down in the adventure."
			case .META_CHARACTER_DOWNGRADE: return "(Meta) Character is downgraded in the adventure."
			case .META_CHARACTER_UPGRADE: return "(Meta) Character is upgraded in the adventure."
			case .META_PLOTLINE_COMBO: return "(Meta) PLotline combo."
		}
	}

	static var plotPointToFullDescriptions = [ADVENTURE_PLOT_POINTS: String]()

	static func getFullDescriptionForPlotPloint(_ plotPoint: ADVENTURE_PLOT_POINTS) -> String {
		if !isFullDescriptionsLoaded() {
			loadPlotPointToFullDescriptions()
		}
		guard let theDescription = plotPointToFullDescriptions[plotPoint] else { return "" }
		return theDescription
	}

	static func isFullDescriptionsLoaded() -> Bool {
		if plotPointToFullDescriptions.count == 0 {
			return false
		}

		return true
	}

	static func loadPlotPointToFullDescriptions() {
		let decoder = JSONDecoder()
		guard
			let path = Bundle.main.path(forResource:"PLOT_POINT_TO_DESCRIPTION", ofType: "json"),
			let data = FileManager.default.contents(atPath: path) else {
				fatalError("Blarg")
		}

		do {
			let plotPointsToDescriptions = try decoder.decode([ADVENTURE_PLOT_POINTS: String].self, from: data)
			ADVENTURE_PLOT_POINTS.plotPointToFullDescriptions = plotPointsToDescriptions
		} catch {
			os_log(.error, log: AdventureCrafterModel.logger, "%s", error.localizedDescription)
		}
	}

}

enum ADVENTURE_CHARACTER_DESCRIPTOR: String, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_CHARACTER_DESCRIPTOR

	static var MIN: Int = 1
	static var MAX: Int = 100

	case ROLL_FOR_TWO_DESCRIPTORS
	case UGLY = "Ugly"
	case BEAUTIFUL = "Beautiful"
	case FOUL = "Foul"
	case SWEET = "Sweet"
	case UNUSUAL = "Unusual"
	case COMMON = "Common"
	case INTELLIGENT = "Intelligent"
	case IGNORANT = "Ignorant"
	case EDUCATED = "Educated"
	case SKILLED = "Skilled"
	case TRAINED = "Trained"
	case RUDE = "Rude"
	case POLITE = "Polite"
	case FANCY = "Fancy"
	case ROUGH = "Rough"
	case DIRTY = "Dirty"
	case CLEAN = "Clean"
	case WEALTHY = "Wealthy"
	case POOR = "Poor"
	case SMALL = "Small"
	case LARGE = "Large"
	case QUIET = "Quiet"
	case LOUD = "Loud"
	case FAST = "Fast"
	case SLOW = "Slow"
	case EXOTIC = "Exotic"
	case UNIFORMED = "Uniformed"
	case INTERESTING = "Interesting"
	case COLORFUL = "Colorful"
	case INFORMATIVE = "Informative"
	case DANGEROUS = "Dangerous"
	case INEPT = "Inept"
	case CLUMSY = "Clumsy"
	case CAPABLE = "Capable"
	case INTRUSIVE = "Intrusive"
	case RESPECTFUL = "Respectful"
	case PRIMITIVE = "Primitive"
	case SOPHISTICATED = "Sophisticated"
	case ELEGANT = "Elegant"
	case ARMED = "Armed"
	case DIFFERENT = "Different"
	case OUNG = "Oung"
	case OLD = "Old"
	case DIFFICULT = "Difficult"
	case HELPFUL = "Helpful"
	case HARMFUL = "Harmful"
	case DISCIPLINED = "Disciplined"
	case ERRATIC = "Erratic"
	case WILD = "Wild"
	case CRAZY = "Crazy"
	case COMMANDING = "Commanding"
	case MEEK = "Meek"
	case HUMOROUS = "Humorous"
	case FRIGHTENED = "Frightened"
	case BRAVE = "Brave"
	case STRONG = "Strong"
	case WEAK = "Weak"
	case IMPULSIVE = "Impulsive"
	case STRATEGIC = "Strategic"
	case NAIVE = "Naive"
	case CONFIDENT = "Confident"
	case SURPRISING = "Surprising"
	case PASSIVE = "Passive"
	case BOLD = "Bold"
	case CARELESS = "Careless"
	case CAUTIOUS = "Cautious"
	case SNEAKY = "Sneaky"
	case INTIMIDATING = "Intimidating"
	case POWERFUL = "Powerful"
	case POWERLESS = "Powerless"
	case HURT = "Hurt"
	case GENTLE = "Gentle"
	case CARING = "Caring"
	case PRINCIPLED = "Principled"
	case ARROGANT = "Arrogant"
	case CURIOUS = "Curious"
	case SUPPORTIVE = "Supportive"
	case HEROIC = "Heroic"
	case PIOUS = "Pious"
	case NONE = "None"

	static func getElementBy(value: Int) -> ADVENTURE_CHARACTER_DESCRIPTOR {
		switch value {
			case 1...21: return .ROLL_FOR_TWO_DESCRIPTORS
			case 22: return .UGLY
			case 23: return .BEAUTIFUL
			case 24: return .FOUL
			case 25: return .SWEET
			case 26: return .UNUSUAL
			case 27: return .COMMON
			case 28: return .INTELLIGENT
			case 29: return .IGNORANT
			case 30: return .EDUCATED
			case 31: return .SKILLED
			case 32: return .TRAINED
			case 33: return .RUDE
			case 34: return .POLITE
			case 35: return .FANCY
			case 36: return .ROUGH
			case 37: return .DIRTY
			case 38: return .CLEAN
			case 39: return .WEALTHY
			case 40: return .POOR
			case 41: return .SMALL
			case 42: return .LARGE
			case 43: return .QUIET
			case 44: return .LOUD
			case 45: return .FAST
			case 46: return .SLOW
			case 47: return .EXOTIC
			case 48: return .UNIFORMED
			case 49: return .INTERESTING
			case 50: return .COLORFUL
			case 51: return .INFORMATIVE
			case 52: return .DANGEROUS
			case 53: return .INEPT
			case 54: return .CLUMSY
			case 55: return .CAPABLE
			case 56: return .INTRUSIVE
			case 57: return .RESPECTFUL
			case 58: return .PRIMITIVE
			case 59: return .SOPHISTICATED
			case 60: return .ELEGANT
			case 61: return .ARMED
			case 62: return .DIFFERENT
			case 63: return .OUNG
			case 64: return .OLD
			case 65: return .DIFFICULT
			case 66: return .HELPFUL
			case 67: return .HARMFUL
			case 68: return .DISCIPLINED
			case 69: return .ERRATIC
			case 70: return .WILD
			case 71: return .CRAZY
			case 72: return .COMMANDING
			case 73: return .MEEK
			case 74: return .HUMOROUS
			case 75: return .FRIGHTENED
			case 76: return .BRAVE
			case 77: return .STRONG
			case 78: return .WEAK
			case 79: return .IMPULSIVE
			case 80: return .STRATEGIC
			case 81: return .NAIVE
			case 82: return .CONFIDENT
			case 83: return .SURPRISING
			case 84: return .PASSIVE
			case 85: return .BOLD
			case 86: return .CARELESS
			case 87: return .CAUTIOUS
			case 88: return .SNEAKY
			case 89: return .INTIMIDATING
			case 90: return .POWERFUL
			case 91: return .POWERLESS
			case 92: return .HURT
			case 93: return .PIOUS
			case 94: return .GENTLE
			case 95: return .CARING
			case 96: return .PRINCIPLED
			case 97: return .ARROGANT
			case 98: return .CURIOUS
			case 99: return .SUPPORTIVE
			case 100: return .HEROIC
			default: return .NONE
		}
	}
}


enum ADVENTURE_CHARACTER_IDENTITY: String, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_CHARACTER_IDENTITY

	static var MIN: Int = 1
	static var MAX: Int = 100

	case ROLL_FOR_TWO_IDENTITIES
	case WARRIOR = "Warrior"
	case HEALER = "Healer"
	case PROTECTOR = "Protector"
	case ASSISTANT = "Assistant"
	case DEPENDENT = "Dependent"
	case RULER = "Ruler"
	case ADMINISTRATOR = "Administrator"
	case VICTIM = "Victim"
	case SCHOLAR = "Scholar"
	case EXPERT = "Expert"
	case ELITE = "Elite"
	case INVESTIGATOR = "Investigator"
	case CRIMINAL = "Criminal"
	case SUPPORTER = "Supporter"
	case HELPLESS = "Helpless"
	case OUTSIDER = "Outsider"
	case MEDIATOR = "Mediator"
	case ENTERTAINER = "Entertainer"
	case SOCIALITE = "Socialite"
	case ATHLETE = "Athlete"
	case PERFORMER = "Performer"
	case REPRESENTATIVE = "Representative"
	case MERCHANT = "Merchant"
	case TRADER = "Trader"
	case CREATOR = "Creator"
	case ARTIST = "Artist"
	case SERVANT = "Servant"
	case LABORER = "Laborer"
	case RELIGIOUS = "Religious"
	case HUNTER = "Hunter"
	case LEADER = "Leader"
	case FIGHTER = "Fighter"
	case CRAFTER = "Crafter"
	case THIEF = "Thief"
	case RADICAL = "Radical"
	case EXECUTIVE = "Executive"
	case THUG = "Thug"
	case GUARD = "Guard"
	case GUARDIAN = "Guardian"
	case EXPLORER = "Explorer"
	case HERO = "Hero"
	case VILLAIN = "Villain"
	case DECEIVER = "Deceiver"
	case ENGINEER = "Engineer"
	case SCOUT = "Scout"
	case FIXER = "Fixer"
	case WANDERER = "Wanderer"
	case SUBVERTER = "Subverter"
	case SOLDIER = "Soldier"
	case LAW_ENFORCEMENT = "Law_Enforcement"
	case SCIENTIST = "Scientist"
	case GATHERER = "Gatherer"
	case FOREIGNER = "Foreigner"
	case SURVIVOR = "Survivor"
	case GAMBLER = "Gambler"
	case ROGUE = "Rogue"
	case FARMER = "Farmer"
	case KILLER = "Killer"
	case PROFESSIONAL = "Professional"
	case DRIVER_OR_PILOT = "Driver_OR_Pilot"
	case STUDENT = "Student"
	case ORGANIZER = "Organizer"
	case DELIVERER = "Deliverer"
	case LACKEY = "Lackey"
	case TEACHER = "Teacher"
	case EXOTIC = "Exotic"
	case NONE = "None"

	static func getElementBy(value: Int) -> ADVENTURE_CHARACTER_IDENTITY {
		switch value {
			case 1...33: return .ROLL_FOR_TWO_IDENTITIES
			case 34: return .WARRIOR
			case 35: return .HEALER
			case 36: return .PROTECTOR
			case 37: return .ASSISTANT
			case 38: return .DEPENDENT
			case 39: return .RULER
			case 40: return .ADMINISTRATOR
			case 41: return .VICTIM
			case 42: return .SCHOLAR
			case 43: return .EXPERT
			case 44: return .ELITE
			case 45: return .INVESTIGATOR
			case 46: return .CRIMINAL
			case 47: return .SUPPORTER
			case 48: return .HELPLESS
			case 49: return .OUTSIDER
			case 50: return .MEDIATOR
			case 51: return .ENTERTAINER
			case 52: return .SOCIALITE
			case 53: return .ATHLETE
			case 54: return .PERFORMER
			case 55: return .REPRESENTATIVE
			case 56: return .MERCHANT
			case 57: return .TRADER
			case 58: return .CREATOR
			case 59: return .ARTIST
			case 60: return .SERVANT
			case 61: return .LABORER
			case 62: return .RELIGIOUS
			case 63: return .HUNTER
			case 64: return .LEADER
			case 65: return .FIGHTER
			case 66: return .CRAFTER
			case 67: return .THIEF
			case 68: return .RADICAL
			case 69: return .EXECUTIVE
			case 70: return .THUG
			case 71: return .GUARD
			case 72: return .GUARDIAN
			case 73: return .EXPLORER
			case 74: return .HERO
			case 75: return .VILLAIN
			case 76: return .DECEIVER
			case 77: return .ENGINEER
			case 78: return .SCOUT
			case 79: return .FIXER
			case 80: return .WANDERER
			case 81: return .SUBVERTER
			case 82: return .SOLDIER
			case 83: return .LAW_ENFORCEMENT
			case 84: return .SCIENTIST
			case 85: return .GATHERER
			case 86: return .FOREIGNER
			case 87: return .SURVIVOR
			case 88: return .GAMBLER
			case 89: return .ROGUE
			case 90: return .FARMER
			case 91: return .KILLER
			case 92: return .PROFESSIONAL
			case 93: return .DRIVER_OR_PILOT
			case 94: return .STUDENT
			case 95: return .ORGANIZER
			case 96: return .DELIVERER
			case 97: return .LACKEY
			case 98: return .TEACHER
			case 99...100: return .EXOTIC
			default: return .NONE
		}
	}

}


enum ADVENTURE_CHARACTER_TRAIT: String, RPG_TABLE, Codable {
	typealias Result = ADVENTURE_CHARACTER_TRAIT

	static var MIN: Int = 1
	static var MAX: Int = 100

	case INDIVIDUAL = "The character is an individual."
	case ORGANIZATION = "The character is an organization."
	case OBJECT = "The character is an object."
	case CONNECTED = "The character is connected to this plotline."
	case NOT_CONNECTED = "The character is not connected to this plotline."
	case HINDERS = "The character hinders resolving this plotline."
	case ASSISTS = "The character assists in resolving this plotline."
	case CONNECTED_TO_CHARACTER = "The character is connected to an existing character."
	case NONE = "None"

	static func getElementBy(value: Int) -> ADVENTURE_CHARACTER_TRAIT {
		switch value {
			case 10...50: return .INDIVIDUAL
			case 51...57: return .ORGANIZATION
			case 58...64: return .OBJECT
			case 65...71: return .CONNECTED
			case 72...78: return .NOT_CONNECTED
			case 79...85: return .HINDERS
			case 86...92: return .ASSISTS
			case 93...100: return .CONNECTED_TO_CHARACTER
			default: return .NONE
		}
	}

	static func getDescriptionOf(trait: ADVENTURE_CHARACTER_TRAIT) -> String {

		switch trait {
			case .INDIVIDUAL: return "The Character is an individual, as opposed to an organization or object."
			case .ORGANIZATION: return "This Character is not a specific individual, but an organization or community. General members of this organization are considered part of the Character as a community."
			case .OBJECT: return "This Character is something other than a typical, living individual or group organization. The Character is an object of some kind that could also be considered a Character unto itself. Examples might include a spaceship that is old and temperamental, or a city teeming with culture."
			case .CONNECTED: return "This Character enters the Adventure somehow connected with the Plotline of this Turning Point."
			case .NOT_CONNECTED: return "This Character enters the Adventure not connected to this Turning Point’s Plotline. The Character may become part of the Plotline in the course of this Turning Point, but does not start off that way. Examples include bystanders to the main events of a Turning Point or people outside the events of the Plotline who get drawn into the Adventure."
			case .HINDERS: return "This Character gets in the way of resolving the current Plotline in some way, likely serving as a complication to the Player Characters."
			case .ASSISTS: return "This Character is someone who can help resolve the current Plotline in some way, likely serving as an aid to the Player Characters."
			case .CONNECTED_TO_CHARACTER: return "This Character has some relationship to another, existing Character in this Adventure. Roll on the Characters List to see who. A result of New Character is changed to Choose The Most Logical Character. The connection can be anything, from the two Characters are related, they know each other, they were former friends, they both work in the same occupation or belong to the same organization, they look or act similarly, they have similar skills or equipment, etc. The connection can be as close or as distant as you like."
			default: return "None"
		}
	}
}
