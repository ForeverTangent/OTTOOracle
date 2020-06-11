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


	private var plotlines = [PlotlineData]()
	private var characters = [CharacterData]()

	func getRandomPlotline() -> String {
		return ""
	}

	func getRandomCharacter() -> String  {
		return ""
	}

}

struct PlotlineData {
	var order: Int
	var plotlineName: String
}

struct CharacterData {
	var order: Int
	var name: String
}


enum PLOTLINES: Int, RPG_TABLE {
	typealias Result = PLOTLINES

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CHOOSE_MOST_LOGICIAL_PLOTLINE = 1
	case NEW_PLOTLINE = 2

	static func getElementBy(value: Int) -> PLOTLINES {
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

enum CHARACTERS: Int, RPG_TABLE {
	typealias Result = CHARACTERS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CHOOSE_MOST_LOGICAL_CHARACTER = 1
	case NEW_CHARACTER = 2

	static func getElementBy(value: Int) -> CHARACTERS {
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


enum ACTION_PLOT_POINT: Int, RPG_TABLE {

	typealias Result = PLOT_POINTS

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

	static func getElementBy(value: Int) -> PLOT_POINTS {
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


enum TENSION_PLOT_POINT: Int, RPG_TABLE {
	typealias Result = PLOT_POINTS

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

	static func getElementBy(value: Int) -> PLOT_POINTS {
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


enum MYSTERY_PLOT_POINT: Int, RPG_TABLE {
	typealias Result = PLOT_POINTS

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

	static func getElementBy(value: Int) -> PLOT_POINTS {
		switch value {
			case 1...8: return .CONCLUSION
			case 9...24: return .NONE
			case 25...26: return .INTO_THE_UNKNOWN
			case 27...28: return .USEFUL_INFORMATION_FROM_AN_UNKNOWN_SOURCE
			case 29...30: return .A_MOTIVE_FREE_CRIME
			case 31...32: return .A_CHARACTER_DISAPPEARS
			case 33: return .THIS_ISNT_WORKING
			case 34...35: return .A_RESOURCE_DISAPPEARS
			case 36: return .FORTUITOUS_FIND
			case 37: return .ALL_IS_REVEALED
			case 38...29: return .USEFUL_INFORMATION_FROM_A_KNOWN_SOURCE
			case 40: return .CRYPTIC_INFORMATION_FROM_A_KNOWN_SOURCE
			case 41...42: return .LIE_DISCOVERED
			case 43: return .SOMETHING_EXOTIC
			case 44...45: return .A_CRIME_IS_COMMITTED
			case 46...47: return .ITS_A_SECRET
			case 48: return .SOMETHING_LOST_HAS_BEEN_FOUND
			case 49: return .THE_OBSERVER
			case 50: return .A_SECRET_WEAPON
			case 51...52: return .LIAR
			case 53: return .A_CHARACTER_ACTS_OUT_OF_CHARACTER
			case 54: return .DEAD
			case 55...56: return .MYSTERY_SOLVED
			case 57: return .SECRET_INFORMATION_LEAKED
			case 58...59: return .SUSPICION
			case 60...61: return .EVIDENCE
			case 62...63: return .THE_PLOT_THICKENS
			case 64: return .DUBIOUS_RATIONALE
			case 65: return .A_CRUCIAL_LIFE_SUPPORT_SYSTEM_BEGINS_TO_FAIL
			case 66...67: return .CRYPTIC_INFORMATION_FROM_AN_UNKNOWN_SOURCE
			case 68...69: return .A_COMMON_THREAD
			case 70: return .NOT_THEIR_MASTER
			case 71...72: return .THE_SECRET_TO_THE_POWER
			case 73...74: return .HIDDEN_AGENDA
			case 75: return .AN_OBJECT_OF_UNKNOWN_USE_IS_FOUND
			case 76: return .CLEAR_THE_RECORD
			case 77: return .FRAMED
			case 78: return .AN_IMPROBABLE_CRIME
			case 79...80: return .THE_HIDDEN_HAND
			case 81...82: return .FIND_IT_OR_ELSE
			case 83: return .TRAVEL_SETTING
			case 84: return .AN_OLD_DEAL
			case 85: return .A_MYSTERIOUS_NEW_PERSON
			case 86: return .RURAL_SETTING
			case 87...88: return .SOMEONE_IS_WHERE_THEY_SHOULD_NOT_BE
			case 89: return .VULNERABILITY_EXPLOITED
			case 90...91: return .FRAUD
			case 92...93: return .BEAT_YOU_TO_IT
			case 94: return .CONSPIRACY_THEORY
			case 95: return .AN_OPPOSING_STORY
			case 96...100: return .META
			default:
				return .NONE
		}
	}
}

enum SOCIAL_PLOT_POINT: Int, RPG_TABLE {
	typealias Result = PLOT_POINTS

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

	static func getElementBy(value: Int) -> PLOT_POINTS {
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


enum PERSONAL_PLOT_PLOINT: Int, RPG_TABLE {
	typealias Result = PLOT_POINTS

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

	static func getElementBy(value: Int) -> PLOT_POINTS {
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


enum META_PLOT_POINTS: String, RPG_TABLE, Codable {

	typealias Result = META_PLOT_POINTS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CHARACTER_EXITS_THE_ADVENTURE
	case CHARACTER_RETURNS
	case CHARACTER_STEPS_UP
	case CHARACTER_STEPS_DOWN
	case CHARACTER_DOWNGRADE
	case CHARACTER_UPGRADE
	case PLOTLINE_COMBO
	case NONE

	static func getElementBy(value: Int) -> META_PLOT_POINTS {
		switch value {
			case 1...18: return .CHARACTER_EXITS_THE_ADVENTURE
			case 19...27: return .CHARACTER_RETURNS
			case 28...36: return .CHARACTER_STEPS_UP
			case 37...55: return .CHARACTER_STEPS_DOWN
			case 56...73: return .CHARACTER_DOWNGRADE
			case 74...82: return .CHARACTER_UPGRADE
			case 83...1000: return .PLOTLINE_COMBO
			default:
				return .NONE
		}
	}

	static var metaPlotPointToDescriptions = [META_PLOT_POINTS: String]()

	static func getDescriptionForMetaPlotPloint(_ metaPlotPoint: META_PLOT_POINTS) -> String {
		guard let theDescription = metaPlotPointToDescriptions[metaPlotPoint] else { return "" }
		return theDescription
	}

	static func loadMetaPlotPointToDescription() {
		let decoder = JSONDecoder()
		guard
			let path = Bundle.main.path(forResource:"META_PLOT_POINT_TO_DESCRIPTION", ofType: "json"),
			let data = FileManager.default.contents(atPath: path) else {
				fatalError("Blarg")
		}

		do {
			let metaPlotPointsToDescriptions = try decoder.decode([META_PLOT_POINTS: String].self, from: data)
			META_PLOT_POINTS.metaPlotPointToDescriptions = metaPlotPointsToDescriptions
		} catch {
			os_log(.error, log: AdventureCrafterModel.logger, "%s", error.localizedDescription)
		}
	}


}


enum PLOT_POINTS: String, Codable {
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

	static func getDescriptionForPlotPloint(_ plotPoint: PLOT_POINTS) -> String {
		guard let theDescription = plotPointToDescriptions[plotPoint] else { return "" }
		return theDescription
	}

	static func loadPlotPointToDescription() {
		let decoder = JSONDecoder()
		guard
			let path = Bundle.main.path(forResource:"PLOT_POINT_TO_DESCRIPTION", ofType: "json"),
			let data = FileManager.default.contents(atPath: path) else {
				fatalError("Blarg")
		}

		do {
			let plotPointsToDescriptions = try decoder.decode([PLOT_POINTS: String].self, from: data)
			PLOT_POINTS.plotPointToDescriptions = plotPointsToDescriptions
		} catch {
			os_log(.error, log: AdventureCrafterModel.logger, "%s", error.localizedDescription)
		}
	}

	static var plotPointToDescriptions = [PLOT_POINTS: String]()

}
