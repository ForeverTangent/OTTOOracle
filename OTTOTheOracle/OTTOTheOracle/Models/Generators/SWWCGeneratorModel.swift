//
//  SWWCOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

/**
SWWC - Savage World's Wildcard Creator
*/
class SWWCGeneratorModel {

	var wcBackground: WildCardBackgroundModel = WildCardBackgroundModel()

	func buildNewCharacterBackground() {
		var backgroundModel = WildCardBackgroundModel()
		buildFamilyHistoryUsingBackgroundModel(&backgroundModel)
		buildChildhoodBackgroundModel(&backgroundModel)
		buildPersonalityAndPhilosophy(&backgroundModel)
		buildLifeEvents(&backgroundModel)
		
		wcBackground = backgroundModel
	}

	private func buildFamilyHistoryUsingBackgroundModel(_ backgroundModel: inout WildCardBackgroundModel) {

		backgroundModel.familyRanking = SWWC_FAMILY_RANKING.randomWeightedElement()
		backgroundModel.familyStatus = SWWC_FAMILY_STATUS.randomWeightedElement()

		if backgroundModel.familyStatus == .DANGER_OF_LOSING_EVERYTHING {
			backgroundModel.familyTradegies = SWWC_FAMILY_TRAGEDY.randomWeightedElement()
		}

		backgroundModel.parentsStatus = SWWC_PARENTAL_STATUS.randomWeightedElement()
		backgroundModel.familyEvents = SWWC_FAMILY_EVENT.randomWeightedElement()

	}

	private func buildChildhoodBackgroundModel(_ backgroundModel: inout WildCardBackgroundModel) {

		let value = Int.random(in: 1...10)

		switch value {
			case 1,3,5,7: // Fortunre
				backgroundModel.childhoodFortune = SWWC_CHILDHOOD_FOURTUNATE_EVENTS.randomWeightedElement()
			case 2,4,6,8: // Tradegy
				backgroundModel.childhoodTrauma = SWWC_CHILDHOOD_TRAUMA_EVENTS.randomWeightedElement()
			case 9, 10: // One of each
				backgroundModel.childhoodFortune = SWWC_CHILDHOOD_FOURTUNATE_EVENTS.randomWeightedElement()
				backgroundModel.childhoodTrauma = SWWC_CHILDHOOD_TRAUMA_EVENTS.randomWeightedElement()
			default:
				break
		}
	}

	private func buildPersonalityAndPhilosophy(_ backgroundModel: inout WildCardBackgroundModel) {
		backgroundModel.personalityType = SWWC_PERSONALITY_TYPE.randomWeightedElement()
		backgroundModel.philosophyType = SWWC_PHILOSPHY_TYPE.getPhilosophyWithPersonality(backgroundModel.personalityType)

		// Drivers
		// Even = Personality driven, Odd Philosphy driven

		// Who do you Value
		if Int.random(in: 1...10) % 2 == 0 {
			backgroundModel.valueWhoMost = SWWC_WHO_YOU_VALUE_MOST.getPersonValuedByPersonality(backgroundModel.personalityType)
		} else {
			backgroundModel.valueWhoMost = SWWC_WHO_YOU_VALUE_MOST.getPersonValuedByPhilosphy(backgroundModel.philosophyType)
		}

		// What do you Value
		if Int.random(in: 1...10) % 2 == 0 {
			backgroundModel.valueWhatObjectMost = SWWC_WHAT_OBJECT_VALUED_MOST.getMVOByPersonality(backgroundModel.personalityType)
		} else {
			backgroundModel.valueWhatObjectMost = SWWC_WHAT_OBJECT_VALUED_MOST.getMVOByPhilosphy(backgroundModel.philosophyType)
		}

		// Personal Motivation
		if Int.random(in: 1...10) % 2 == 0 {
			backgroundModel.personalMotivation = SWWC_PERSONAL_MOTIVATION.getMVPByPersonality(backgroundModel.personalityType)
		} else {
			backgroundModel.personalMotivation = SWWC_PERSONAL_MOTIVATION.getMVPByPhilosphy(backgroundModel.philosophyType)
		}


		// Worldview
		if Int.random(in: 1...10) % 2 == 0 {
			backgroundModel.personalWorldview = SWWC_WORLDVIEW.getWorldviewByPersonality(backgroundModel.personalityType)
		} else {
			backgroundModel.personalWorldview = SWWC_WORLDVIEW.getWorldviewByPhilosphy(backgroundModel.philosophyType)
		}

		// Worldview
		if Int.random(in: 1...10) % 2 == 0 {
			backgroundModel.personalWorldview = SWWC_WORLDVIEW.getWorldviewByPersonality(backgroundModel.personalityType)
		} else {
			backgroundModel.personalWorldview = SWWC_WORLDVIEW.getWorldviewByPhilosphy(backgroundModel.philosophyType)
		}

	}

	private func buildLifeEvents(_ backgroundModel: inout WildCardBackgroundModel) {

		backgroundModel.age = SWWC_AGE_RANGE.randomWeightedElement()

		var numberOfLifeEvents = 0

		switch backgroundModel.age {
			case .YOUNG: numberOfLifeEvents = Int.random(in: 1...10)
			case .ADULT: numberOfLifeEvents = Int.random(in: 2...20)
			case .ELDERLY: numberOfLifeEvents = Int.random(in: 2...20) + 5
			default: numberOfLifeEvents = 0
		}

		for _ in 1...numberOfLifeEvents {
			backgroundModel.lifeEvents.append(SWWC_LIFE_EVENTS.randomWeightedElement())
		}

		for _ in 1...getEnemyLifeEventsCount(&backgroundModel) {
			backgroundModel.enemies.append(EnemyDetails(cause: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_CAUSE.randomWeightedElement(),
														direction: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_DIRECTION.randomWeightedElement(),
														action: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_ACTION.randomWeightedElement(),
														tools: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_TOOLS.randomWeightedElement()))
		}

		for _ in 1...getRomanticEventsCount(&backgroundModel) {
			let howItWorkedOut = SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS.randomWeightedElement()
			switch howItWorkedOut {
				case .HAPPY_LOVE_AFFAIR:
					backgroundModel.romances.append(RomanceDetails(tone: howItWorkedOut,
																   tradegy: .NONE,
																   problem: .NONE,
																   currentFeeling: .NONE))
				case .TRAGIC_LOVE_AFFAIR:
					backgroundModel.romances.append(
						RomanceDetails(tone: howItWorkedOut,
									   tradegy: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_TRAGIC.randomWeightedElement(),
									   problem: .NONE,
									   currentFeeling: .NONE))
				case .LOVE_AFFAIR_WITH_PROBLEMS:
					backgroundModel.romances.append(
						RomanceDetails(tone: howItWorkedOut,
									   tradegy: .NONE,
									   problem: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_WITH_PROBLEMS.randomWeightedElement(),
									   currentFeeling: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_MUTUAL_FEELINGS.randomWeightedElement()))
				case .FAST_AFFAIR:
					backgroundModel.romances.append(
						RomanceDetails(tone: howItWorkedOut,
									   tradegy: .NONE,
									   problem: .NONE,
									   currentFeeling: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_MUTUAL_FEELINGS.randomWeightedElement()))
				case .NONE:
					break
			}
		}
	}


	private func getEnemyLifeEventsCount(_ backgroundModel: inout WildCardBackgroundModel) -> Int {
		func isEnemyEvent(_ event: SWWC_LIFE_EVENTS) -> Bool {
			if
				backgroundModel.lifeEvents.contains(.FRIEND_TO_ENEMY),
				backgroundModel.lifeEvents.contains(.CHILDHOOD_ENEMY),
				backgroundModel.lifeEvents.contains(.LOVER_TO_ENEMY),
				backgroundModel.lifeEvents.contains(.ENEMY_AGENT),
				backgroundModel.lifeEvents.contains(.TICKED_OFF_ENEMY),
				backgroundModel.lifeEvents.contains(.TEAM_MEMBER_ENEMY),
				backgroundModel.lifeEvents.contains(.RELATIVE_ENEMY),
				backgroundModel.lifeEvents.contains(.UNDERWORLD_CRIME_LORD_ENEMY),
				backgroundModel.lifeEvents.contains(.POWERFUL_PERSON_ENEMY),
				backgroundModel.lifeEvents.contains(.GOVERNMENT_PERSON_ENEMY) {
				return true
			}
			return false
		}
		let enemyCount: Int = backgroundModel.lifeEvents.map { isEnemyEvent($0) ? 1 : 0 }.reduce(0, +)
		print(enemyCount)
		return enemyCount
	}


	private func getRomanticEventsCount(_ backgroundModel: inout WildCardBackgroundModel) -> Int {
		let romanticEvents: Int = backgroundModel.lifeEvents.map { $0 == .ROMANTIC_AFFAIR ? 1 : 0 }.reduce(0, +)
		return romanticEvents
	}

}


struct WildCardBackgroundModel {
	var familyRanking: SWWC_FAMILY_RANKING = .NONE
	var familyStatus: SWWC_FAMILY_STATUS = .NONE
	var parentsStatus: SWWC_PARENTAL_STATUS = .NONE
	var familyTradegies: SWWC_FAMILY_TRAGEDY = .NONE
	var familyEvents: SWWC_FAMILY_EVENT = .NONE
	var childhoodFortune: SWWC_CHILDHOOD_FOURTUNATE_EVENTS = .NONE
	var childhoodTrauma: SWWC_CHILDHOOD_TRAUMA_EVENTS = .NONE
	var personalityType: SWWC_PERSONALITY_TYPE = .NONE
	var philosophyType: SWWC_PHILOSPHY_TYPE = .NONE
	var valueWhoMost: SWWC_WHO_YOU_VALUE_MOST = .NONE
	var valueWhatObjectMost: SWWC_WHAT_OBJECT_VALUED_MOST = .NONE
	var personalMotivation: SWWC_PERSONAL_MOTIVATION = .NONE
	var personalWorldview: SWWC_WORLDVIEW = .NONE
	var age: SWWC_AGE_RANGE = .NONE
	var lifeEvents: [SWWC_LIFE_EVENTS] = [SWWC_LIFE_EVENTS]()
	var enemies: [EnemyDetails] = [EnemyDetails]()
	var romances: [RomanceDetails] = [RomanceDetails]()

}

struct EnemyDetails {
	var cause: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_CAUSE = .NONE
	var direction: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_DIRECTION = .NONE
	var action: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_ACTION = .NONE
	var tools: SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_TOOLS = .NONE
}


struct RomanceDetails {
	var tone: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS = .NONE
	var tradegy: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_TRAGIC = .NONE
	var problem: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_WITH_PROBLEMS = .NONE
	var currentFeeling: SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_MUTUAL_FEELINGS = .NONE

}


enum SWWC_SIBLING_BIOLOGICAL_SEX: String, RPG_TABLE, Codable {
	typealias Result = SWWC_SIBLING_BIOLOGICAL_SEX

	static var MIN: Int = 1
	static var MAX: Int = 2

	case MALE
	case FEMALE
	case NONE

	var descriptionShort: String { get { return self.rawValue.capitalized } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_SIBLING_BIOLOGICAL_SEX {
		switch value {
			case 1: return .MALE
			case 2: return .FEMALE
			default: return .NONE
		}
	}
}


enum SWWC_SIBLING_SEX_ORIENTATION: String, RPG_TABLE, Codable {
	typealias Result = SWWC_SIBLING_SEX_ORIENTATION

	static var MIN: Int = 1
	static var MAX: Int = 100

	case STRAIGHT
	case GAY
	case OTHER // Non-Binary, Trans, etc...
	case NONE

	var descriptionShort: String { get { return self.rawValue.capitalized } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_SIBLING_SEX_ORIENTATION {
		switch value {
			case 1...89: return .STRAIGHT
			case 90...99: return .GAY
			case 100: return .OTHER
			default: return .NONE
		}
	}
}


enum SWWC_SIBLING_BIOLOGICAL_AGE_RELATION: String, RPG_TABLE, Codable {
	typealias Result = SWWC_SIBLING_BIOLOGICAL_AGE_RELATION

	static var MIN: Int = 1
	static var MAX: Int = 10

	case OLDER
	case YOUNGER
	case TWIN
	case NONE

	var descriptionShort: String { get { return self.rawValue.capitalized } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_SIBLING_BIOLOGICAL_AGE_RELATION {
		switch value {
			case 1...5: return .OLDER
			case 6...7: return .YOUNGER
			case 10: return .TWIN
			default: return .NONE
		}
	}
}


enum SWWC_SIBLING_FEELINGS_TO_PC: String, RPG_TABLE, Codable {
	typealias Result = SWWC_SIBLING_FEELINGS_TO_PC

	static var MIN: Int = 1
	static var MAX: Int = 10

	case DISLIKES_YOU = "Dislikes you..."
	case LIKES_YOU = "Likes you..."
	case NEUTRAL = "Neutral..."
	case WORSHIP_YOU = "Worship you..."
	case HATE_YOU = "Hate you..."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_SIBLING_FEELINGS_TO_PC {
		switch value {
			case 1...2: return .DISLIKES_YOU
			case 3...4: return .LIKES_YOU
			case 5...6: return .NEUTRAL
			case 7...8: return .WORSHIP_YOU
			case 9...10: return .HATE_YOU
			default: return .NONE
		}
	}
}

enum SWWC_FAMILY_RANKING: String, RPG_TABLE, Codable {
	typealias Result = SWWC_FAMILY_RANKING

	static var MIN: Int = 1
	static var MAX: Int = 10

	case POOR = "Poor"
	case MIDDLE_CLASS = "Middle Class"
	case WELL_TO_DO = "Well to do"
	case LOWER_UPPPER = "Lower Upper"
	case WEALTHY = "Rich"
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_FAMILY_RANKING {
		switch value {
			case 1...2: return .POOR
			case 3...5: return .MIDDLE_CLASS
			case 6...7: return .WELL_TO_DO
			case 8...9: return .LOWER_UPPPER
			case 10: return .WEALTHY
			default: return .NONE
		}
	}
}


enum SWWC_FAMILY_STATUS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_FAMILY_STATUS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case DANGER_OF_LOSING_EVERYTHING = "In Danger of losing everything."
	case STABLE = "Family status is ok."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_FAMILY_STATUS {
		switch value {
			case 1...5: return .DANGER_OF_LOSING_EVERYTHING
			case 6...10: return .STABLE
			default: return .NONE
		}
	}
}

enum SWWC_PARENTAL_STATUS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_PARENTAL_STATUS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case BOTH_LIVE = "Both parents are still alive."
	case ORPHAN = "One or both parents are MIA."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_PARENTAL_STATUS {
		switch value {
			case 1...5: return .BOTH_LIVE
			case 6...10: return .ORPHAN
			default: return .NONE
		}
	}
}

enum SWWC_FAMILY_TRAGEDY: String, RPG_TABLE, Codable {
	typealias Result = SWWC_FAMILY_TRAGEDY

	static var MIN: Int = 1
	static var MAX: Int = 10

	case BETRAYED = "Family was bettrayed."
	case LOST_EVERYTHING = "Family lost everything."
	case EXILED = "Family was exiled or deported."
	case IMPRISONED = "Family was imprisoned."
	case VANISHED = "Family vanished."
	case MURDERED = "Family was murdered."
	case CONSPIRACY = "Family was involved in a conspiracty."
	case SCATTERED = "Family was scattered."
	case FEUD = "Family is a feud with another (or more)."
	case DEBT = "Family is in debt"
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_FAMILY_TRAGEDY {
		switch value {
			case 1: return .BETRAYED
			case 2: return .LOST_EVERYTHING
			case 3: return .EXILED
			case 4: return .IMPRISONED
			case 5: return .VANISHED
			case 6: return .MURDERED
			case 7: return .CONSPIRACY
			case 8: return .SCATTERED
			case 9: return .FEUD
			case 10: return .DEBT
			default: return .NONE
		}
	}
}


enum SWWC_FAMILY_EVENT: String, RPG_TABLE, Codable {
	typealias Result = SWWC_FAMILY_EVENT

	static var MIN: Int = 1
	static var MAX: Int = 10

	case DIED_IN_WAR = "Parent(s) died in war."
	case DIED_IN_ACCIDENT = "Parent(s) died in an accident."
	case MURDERED = "Parent(s) were murdered."
	case DISOWNED = "Parent(s) disowned you."
	case UNKNOWN = "Never knew parents."
	case HIDING = "Parent(s) are in hiding."
	case RELATIVES = "Relatives raised you."
	case STREETS = "Grew up on the streets."
	case ADOPTED = "You were adopted."
	case SOLD = "Parent(s) sold you for money."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_FAMILY_EVENT {
		switch value {
			case 1: return .DIED_IN_WAR
			case 2: return .DIED_IN_ACCIDENT
			case 3: return .MURDERED
			case 4: return .DISOWNED
			case 5: return .UNKNOWN
			case 6: return .HIDING
			case 7: return .RELATIVES
			case 8: return .STREETS
			case 9: return .ADOPTED
			case 10: return .SOLD
			default: return .NONE
		}
	}
}

enum SWWC_CHILDHOOD_EVENTS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_CHILDHOOD_EVENTS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case MUDANE = "Childhood was uneventful."
	case FOURTUNE = "Childhood had a fortunate event."
	case TRAUMA = "Childhood had a unfortunate trauma."
	case BOTH = "Childhood was both forunate and tramatic."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_CHILDHOOD_EVENTS {
		switch value {
			case 1: return .MUDANE
			case 2...5: return .FOURTUNE
			case 6...9: return .TRAUMA
			case 10: return .BOTH
			default: return .NONE
		}
	}
}

enum SWWC_CHILDHOOD_FOURTUNATE_EVENTS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_CHILDHOOD_FOURTUNATE_EVENTS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case CARING_FAMILY = "You have a caring family."
	case ACE_STUDENT = "You were best in your class, or super smart for your age."
	case POPULAR = "You were a popular kid."
	case AWARD = "You won an award."
	case FRIENDS = "You had a lot of good friends."
	case SECRET = "You learned a vita secret."
	case DISCOVERY = "You discovered something."
	case HEROIC_PUBLIC = "You did something heroic, publicly known."
	case HEROIC_PRIVATE = "You did something heroic, only a few know."
	case CELEBRITY = "You were a celebrity, child star."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_CHILDHOOD_FOURTUNATE_EVENTS {
		switch value {
			case 1: return .CARING_FAMILY
			case 2: return .ACE_STUDENT
			case 3: return .POPULAR
			case 4: return .AWARD
			case 5: return .FRIENDS
			case 6: return .SECRET
			case 7: return .DISCOVERY
			case 8: return .HEROIC_PUBLIC
			case 9: return .HEROIC_PRIVATE
			case 10: return .CELEBRITY
			default: return .NONE
		}
	}
}

enum SWWC_CHILDHOOD_TRAUMA_EVENTS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_CHILDHOOD_TRAUMA_EVENTS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case ACCIDENT = "You had a terrible accident."
	case ABUSED = "You were abused by parent(s)."
	case UNEMPLOYED = "You parent(s) lost their jobs."
	case ILL = "You had a terrible illness."
	case HUMILIATED = "You were horribly humiliated."
	case LOST_HOME = "Home was destroyed."
	case GANGS = "You were bullied/tourmened by others."
	case LOST_FRIEND = "You lost a close friend."
	case HOSTAGE = "You were kidnapped."
	case HUNTED = "You were hunted."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_CHILDHOOD_TRAUMA_EVENTS {
		switch value {
			case 1: return .ACCIDENT
			case 2: return .ABUSED
			case 3: return .UNEMPLOYED
			case 4: return .ILL
			case 5: return .HUMILIATED
			case 6: return .LOST_HOME
			case 7: return .GANGS
			case 8: return .LOST_FRIEND
			case 9: return .HOSTAGE
			case 10: return .HUNTED
			default: return .NONE
		}
	}
}

enum SWWC_PERSONALITY_TYPE: String, RPG_TABLE, Codable {

	typealias Result = SWWC_PERSONALITY_TYPE

	static var MIN: Int = 1
	static var MAX: Int = 10

	case EXTROVERTED_VAPID = "Extraverted, silly and fluffheaded"
	case EXTROVERTED_FRIENDLY = "Extraverted, friendly and outgoing"
	case CASUAL = "Casual and carefree."
	case MOODY = "Moddy, rash, and heastrong."
	case INTROVERTED_STABLE = "Interverted, stable and serious."
	case INTROVERTED_ALOOF = "Interverted, aloof."
	case INTROVERTED_INTELLECTUAL = "Interverted, intellectual and detached."
	case SCHEMING = "Scheming, sneaky, and deceptive."
	case COLD = "Cold, arrogent, ruthless."
	case PSYCHOPATH = "Anti-social, violent, sadistic, cruel."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_PERSONALITY_TYPE {
		switch value {
			case 1: return .EXTROVERTED_VAPID
			case 2: return .EXTROVERTED_FRIENDLY
			case 3: return .CASUAL
			case 4: return .MOODY
			case 5: return .INTROVERTED_STABLE
			case 6: return .INTROVERTED_ALOOF
			case 7: return .INTROVERTED_INTELLECTUAL
			case 8: return .SCHEMING
			case 9: return .COLD
			case 10: return .PSYCHOPATH
			default: return .NONE
		}
	}


	func getValueOfPersonalityType() -> Int {
		switch self {
			case .EXTROVERTED_VAPID, .EXTROVERTED_FRIENDLY: return 1
			case .CASUAL, .MOODY: return 2
			case .INTROVERTED_STABLE, .INTROVERTED_ALOOF: return 2
			case .INTROVERTED_INTELLECTUAL, .SCHEMING: return 4
			case .COLD, .PSYCHOPATH: return 5
			default: return 0
		}
	}

}

enum SWWC_PHILOSPHY_TYPE: String, RPG_TABLE, Codable {

	typealias Result = SWWC_PHILOSPHY_TYPE

	static var MIN: Int = 1
	static var MAX: Int = 10

	case LOVE = "Love is the greatest virtue."
	case GOOD_TIME = "Just have a good time."
	case FRIENDSHIP = "Friendship is everything."
	case HONESTY = "Honesty is purity."
	case HONOR = "Honor is everything."
	case MONEY = "Aquistion is everything."
	case POWER = "Power rules all things."
	case REVENGE = "Revenge is sweet."
	case SURVIVAL = "Survival of the fittest."
	case CHAOS = "Entropy and chaos shall previal."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_PHILOSPHY_TYPE {
		switch value {
			case 1: return .LOVE
			case 2: return .GOOD_TIME
			case 3: return .FRIENDSHIP
			case 4: return .HONESTY
			case 5: return .HONOR
			case 6: return .MONEY
			case 7: return .POWER
			case 8: return .REVENGE
			case 9: return .SURVIVAL
			case 10: return .CHAOS
			default: return .NONE
		}
	}

	static func getPhilosophyWithPersonality(_ personality: SWWC_PERSONALITY_TYPE) -> SWWC_PHILOSPHY_TYPE {
		var SRNG = SystemRandomNumberGenerator()
		let result = personality.getValueOfPersonalityType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .LOVE
			case 3...4: return .GOOD_TIME
			case 5: return .FRIENDSHIP
			case 6: return .HONESTY
			case 7...8: return .HONOR
			case 9: return .MONEY
			case 10...11: return .POWER
			case 12: return .REVENGE
			case 13...14: return .SURVIVAL
			case 15: return .CHAOS
			default: return .NONE
		}
	}

	func getValueOfPhilosphyType() -> Int {
		switch self {
			case .LOVE, .GOOD_TIME: return 1
			case .FRIENDSHIP, .HONESTY: return 2
			case .HONOR, .MONEY: return 2
			case .POWER, .REVENGE: return 4
			case .SURVIVAL, .CHAOS: return 5
			default: return 0
		}
	}


}


enum SWWC_WHO_YOU_VALUE_MOST: String, RPG_TABLE, Codable {

	typealias Result = SWWC_WHO_YOU_VALUE_MOST

	static var MIN: Int = 1
	static var MAX: Int = 14

	case EVERYONE = "You value everyone."
	case ALL_KNOWN = "Everyone you know is valuable."
	case PARENTS = "Your parents."
	case SIBLING = "Sibling (your choice)."
	case CLOSE_FRIEND = "Close personal friend."
	case LOVER = "You girlfriend/boyfriend."
	case CELEBRITY = "A celebrity figure."
	case TEACHER = "A teacher."
	case HERO = "A hero."
	case APATHIC = "You value no one."
	case YOURSELF = "Only yourself is important."
	case NO_ONE = "You don't value yourself."
	case DISLIKE = "You dislike everyone, including yourself."
	case HATE = "You hate everyone, including yourself."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_WHO_YOU_VALUE_MOST {
		switch value {
			case 1: return .EVERYONE
			case 2: return .ALL_KNOWN
			case 3: return .PARENTS
			case 4: return .SIBLING
			case 5: return .CLOSE_FRIEND
			case 6: return .LOVER
			case 7: return .CELEBRITY
			case 8: return .TEACHER
			case 9: return .HERO
			case 10: return .APATHIC
			case 11: return .YOURSELF
			case 12: return .NO_ONE
			case 13: return .DISLIKE
			case 14: return .HATE
			default: return .NONE
		}
	}

	static func getPersonValuedByPersonality(_ personality: SWWC_PERSONALITY_TYPE) -> SWWC_WHO_YOU_VALUE_MOST {
		var SRNG = SystemRandomNumberGenerator()
		let result = personality.getValueOfPersonalityType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .EVERYONE
			case 3: return .ALL_KNOWN
			case 4: return .PARENTS
			case 5: return .SIBLING
			case 6: return .CLOSE_FRIEND
			case 7: return .LOVER
			case 8: return .CELEBRITY
			case 9: return .TEACHER
			case 10: return .HERO
			case 11: return .APATHIC
			case 12: return .YOURSELF
			case 13: return .NO_ONE
			case 14: return .DISLIKE
			case 15: return .HATE
			default: return .NONE
		}
	}

	static func getPersonValuedByPhilosphy(_ philosphy: SWWC_PHILOSPHY_TYPE) -> SWWC_WHO_YOU_VALUE_MOST {
		var SRNG = SystemRandomNumberGenerator()
		let result = philosphy.getValueOfPhilosphyType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .EVERYONE
			case 3: return .ALL_KNOWN
			case 4: return .PARENTS
			case 5: return .SIBLING
			case 6: return .CLOSE_FRIEND
			case 7: return .LOVER
			case 8: return .CELEBRITY
			case 9: return .TEACHER
			case 10: return .HERO
			case 11: return .APATHIC
			case 12: return .YOURSELF
			case 13: return .NO_ONE
			case 14: return .DISLIKE
			case 15: return .HATE
			default: return .NONE
		}
	}

}



enum SWWC_WHAT_OBJECT_VALUED_MOST: String, RPG_TABLE, Codable {

	typealias Result = SWWC_WHAT_OBJECT_VALUED_MOST

	static var MIN: Int = 1
	static var MAX: Int = 14

	case MEMORIES = "Nothing, just beautiful memories."
	case TOKEN = "An un-unique token, like a flower"
	case HEIRLOOM = "A family heirloom."
	case MEMENTO = "An unique, but valueless memento."
	case PICTURE = "A picture."
	case TOY = "A childhood toy."
	case BOOK = "A favorite book, or source of knoledge/wisdom."
	case COLLECTABLE = "A valuable collectable."
	case GADGET = "A device or gadget."
	case VEHICLE = "A vehicle."
	case WEALTH = "Money and wealth."
	case WEAPON = "A weapon."
	case TROPHY = "A token of an enemy, or overcome obstical."
	case PLAN = "A master plan for some greater goal."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_WHAT_OBJECT_VALUED_MOST {
		switch value {
			case 1: return .MEMORIES
			case 2: return .TOKEN
			case 3: return .HEIRLOOM
			case 4: return .MEMENTO
			case 5: return .PICTURE
			case 6: return .TOY
			case 7: return .BOOK
			case 8: return .COLLECTABLE
			case 9: return .GADGET
			case 10: return .VEHICLE
			case 11: return .WEALTH
			case 12: return .WEAPON
			case 13: return .TROPHY
			case 14: return .PLAN
			default: return .NONE
		}
	}

	static func getMVOByPersonality(_ personality: SWWC_PERSONALITY_TYPE) -> SWWC_WHAT_OBJECT_VALUED_MOST {
		var SRNG = SystemRandomNumberGenerator()
		let result = personality.getValueOfPersonalityType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .MEMORIES
			case 3: return .TOKEN
			case 4: return .HEIRLOOM
			case 5: return .MEMENTO
			case 6: return .PICTURE
			case 7: return .TOY
			case 8: return .BOOK
			case 9: return .COLLECTABLE
			case 10: return .GADGET
			case 11: return .VEHICLE
			case 12: return .WEALTH
			case 13: return .WEAPON
			case 14: return .TROPHY
			case 15: return .PLAN
			default: return .NONE
		}
	}

	static func getMVOByPhilosphy(_ philosphy: SWWC_PHILOSPHY_TYPE) -> SWWC_WHAT_OBJECT_VALUED_MOST {
		var SRNG = SystemRandomNumberGenerator()
		let result = philosphy.getValueOfPhilosphyType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .MEMORIES
			case 3: return .TOKEN
			case 4: return .HEIRLOOM
			case 5: return .MEMENTO
			case 6: return .PICTURE
			case 7: return .TOY
			case 8: return .BOOK
			case 9: return .COLLECTABLE
			case 10: return .GADGET
			case 11: return .VEHICLE
			case 12: return .WEALTH
			case 13: return .WEAPON
			case 14: return .TROPHY
			case 15: return .PLAN
			default: return .NONE
		}
	}

}



enum SWWC_PERSONAL_MOTIVATION: String, RPG_TABLE, Codable {

	typealias Result = SWWC_PERSONAL_MOTIVATION

	static var MIN: Int = 1
	static var MAX: Int = 14

	case THE_WHOLE_WORLD = "The whole world."
	case ALL_LIFE = "All life."
	case TRUTH = "Truth."
	case WISDOM = "Wisdom, above all."
	case JUSTICE = "A sense of justice."
	case HONOR = "Your honor."
	case FREEDOM = "Your freedom."
	case APPEARANCE = "You looks and/or reputation."
	case WEALTH = "Wealth and money."
	case RESPECT = "That others respect you."
	case STRENTH = "Your strength."
	case POWER = "Attaining power."
	case CONQUEST = "Greater conquest."
	case DESTRUCTION = "Destroying and/or killing everything."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_PERSONAL_MOTIVATION {
		switch value {
			case 1: return .THE_WHOLE_WORLD
			case 2: return .ALL_LIFE
			case 3: return .TRUTH
			case 4: return .WISDOM
			case 5: return .JUSTICE
			case 6: return .HONOR
			case 7: return .FREEDOM
			case 8: return .APPEARANCE
			case 9: return .WEALTH
			case 10: return .RESPECT
			case 11: return .STRENTH
			case 12: return .POWER
			case 13: return .CONQUEST
			case 14: return .DESTRUCTION
			default: return .NONE
		}
	}

	static func getMVPByPersonality(_ personality: SWWC_PERSONALITY_TYPE) -> SWWC_PERSONAL_MOTIVATION {
		var SRNG = SystemRandomNumberGenerator()
		let result = personality.getValueOfPersonalityType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .THE_WHOLE_WORLD
			case 3: return .ALL_LIFE
			case 4: return .TRUTH
			case 5: return .WISDOM
			case 6: return .JUSTICE
			case 7: return .HONOR
			case 8: return .FREEDOM
			case 9: return .APPEARANCE
			case 10: return .WEALTH
			case 11: return .RESPECT
			case 12: return .STRENTH
			case 13: return .POWER
			case 14: return .CONQUEST
			case 15: return .DESTRUCTION
			default: return .NONE
		}
	}

	static func getMVPByPhilosphy(_ philosphy: SWWC_PHILOSPHY_TYPE) -> SWWC_PERSONAL_MOTIVATION {
		var SRNG = SystemRandomNumberGenerator()
		let result = philosphy.getValueOfPhilosphyType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .THE_WHOLE_WORLD
			case 3: return .ALL_LIFE
			case 4: return .TRUTH
			case 5: return .WISDOM
			case 6: return .JUSTICE
			case 7: return .HONOR
			case 8: return .FREEDOM
			case 9: return .APPEARANCE
			case 10: return .WEALTH
			case 11: return .RESPECT
			case 12: return .WEALTH
			case 13: return .POWER
			case 14: return .CONQUEST
			case 15: return .DESTRUCTION
			default: return .NONE
		}
	}

}



enum SWWC_WORLDVIEW: String, RPG_TABLE, Codable {

	typealias Result = SWWC_WORLDVIEW

	static var MIN: Int = 1
	static var MAX: Int = 14

	case LOVE_EVERYONE = "Love for everyone."
	case PEOPLE_ARE_WONDERFUL = "People are wonderful."
	case ALL_VALUEABLE = "Every person is a valuble indivisual."
	case MOST_EVERYONE = "I like most everyone."
	case NEUTRAL = "I'm neutral to most people."
	case INVINCIBLE = "No one can hurt me."
	case WHATEVER = "Yeah, whatever."
	case EMO = "No one understands me."
	case FATALISTIC = "You are born, you live, then die."
	case RESPECT = "You must earn my respect."
	case PESTIMISTIC = "Everyone is evil, and untrustworthy."
	case TOOLS = "People are tools, use them then lose them."
	case SHEEP = "People are sheep, born to be led."
	case USELESS = "People are scum and should all be killed."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_WORLDVIEW {
		switch value {
			case 1: return .LOVE_EVERYONE
			case 2: return .PEOPLE_ARE_WONDERFUL
			case 3: return .ALL_VALUEABLE
			case 4: return .MOST_EVERYONE
			case 5: return .NEUTRAL
			case 6: return .INVINCIBLE
			case 7: return .WHATEVER
			case 8: return .EMO
			case 9: return .FATALISTIC
			case 10: return .RESPECT
			case 11: return .PESTIMISTIC
			case 12: return .TOOLS
			case 13: return .SHEEP
			case 14: return .USELESS
			default: return .NONE
		}
	}

	static func getWorldviewByPersonality(_ personality: SWWC_PERSONALITY_TYPE) -> SWWC_WORLDVIEW {
		var SRNG = SystemRandomNumberGenerator()
		let result = personality.getValueOfPersonalityType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .LOVE_EVERYONE
			case 3: return .PEOPLE_ARE_WONDERFUL
			case 4: return .ALL_VALUEABLE
			case 5: return .MOST_EVERYONE
			case 6: return .NEUTRAL
			case 7: return .INVINCIBLE
			case 8: return .WHATEVER
			case 9: return .EMO
			case 10: return .FATALISTIC
			case 11: return .RESPECT
			case 12: return .PESTIMISTIC
			case 13: return .TOOLS
			case 14: return .SHEEP
			case 15: return .USELESS
			default: return .NONE
		}
	}

	static func getWorldviewByPhilosphy(_ philosphy: SWWC_PHILOSPHY_TYPE) -> SWWC_WORLDVIEW {
		var SRNG = SystemRandomNumberGenerator()
		let result = philosphy.getValueOfPhilosphyType() + Int.random(in: 1...10, using: &SRNG)

		switch result {
			case 2: return .LOVE_EVERYONE
			case 3: return .PEOPLE_ARE_WONDERFUL
			case 4: return .ALL_VALUEABLE
			case 5: return .MOST_EVERYONE
			case 6: return .NEUTRAL
			case 7: return .INVINCIBLE
			case 8: return .WHATEVER
			case 9: return .EMO
			case 10: return .FATALISTIC
			case 11: return .RESPECT
			case 12: return .PESTIMISTIC
			case 13: return .TOOLS
			case 14: return .SHEEP
			case 15: return .USELESS
			default: return .NONE
		}
	}

}


enum SWWC_AGE_RANGE: String, RPG_TABLE, Codable {
	typealias EnumerationType = SWWC_AGE_RANGE

	static var MIN: Int = 1
	static var MAX: Int = 10

	case YOUNG
	case ADULT
	case ELDERLY
	case NONE

	var descriptionShort: String { get { return rawValue.capitalized } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_AGE_RANGE {
		switch value {
			case 1...3: return .YOUNG
			case 4...7: return .ADULT
			case 8...10: return .ELDERLY
			default: return .NONE
		}
	}

}


enum SWWC_LIFE_EVENTS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS

	static var MIN: Int = 1
	static var MAX: Int = 10

	// Base
	case NONE
	case JACKPOT
	case TAPPED_OUT
	case LUCKY_STAR
	case STAR_CROSSED
	case TAKE_A_FRIEND
	case MAKE_AN_ENEMY
	case LIFETIME_ADVENTURE
	case TRAGIC_MISFORTUNE
	case WITNESS
	case ROMANTIC_AFFAIR
	// SWWC_LIFE_EVENTS_JACKPOT
	case INHERITANCE
	case HEIRLOOM
	case FIND
	case GAMBLE_WON
	case RELIC
	case LUCKY_TRADE
	case LOVE_TOKEN
	case SPECIAL_ITEM
	case FAVOR_OWED_TO_YOU
	case SETTLEMENT_TROPHY
	// SWWC_LIFE_EVENTS_TAPPED_OUT
	case ROBBED
	case GAMBLE_LOST
	case DESTROYED
	case LOST
	case DEBT
	case SWINDLED
	case JUNK
	case CURSED
	case FAVOR_YOU_OWED
	case BLACKMAILED
	// SWWC_LIFE_EVENTS_LUCKY_STAR
	case LUCKY
	case RICH
	case ALERT
	case AMBIDEXTROUS
	case ATTRACTIVE
	case QUICK
	case NOBLE
	case FAST_HEALER
	case BRAWNY
	case BERSERK
	// SWWC_LIFE_EVENTS_STAR_CROSSED
	case CRIPPLING_INJURY
	case DISFIGURED
	case ILLNESS
	case MENTAL_TRAUMA
	case BAD_EYES
	case ADDICTION
	case DEBILITATING_INJURY
	case ALL_THUMBS
	case CLUELESS
	case QUIRK
	// SWWC_LIFE_EVENTS_TAKE_A_FRIEND
	case ENEMY_RIVAL_FRIEND
	case UNDERWORLD_CONTACT_FRIEND
	case OFFICIAL_FRIEND
	case COMPANION_FRIEND
	case SOCIETY_FRIEND
	case MENTOR_FRIEND
	case RICH_RELATIVE
	case GADGETEER_FRIEND
	case BODY_GUARD_FRIEND
	case HEALER_FRIEND
	// SWWC_LIFE_EVENTS_MAKE_AN_ENEMY
	case FRIEND_TO_ENEMY
	case CHILDHOOD_ENEMY
	case LOVER_TO_ENEMY
	case ENEMY_AGENT
	case TICKED_OFF_ENEMY
	case TEAM_MEMBER_ENEMY
	case RELATIVE_ENEMY
	case UNDERWORLD_CRIME_LORD_ENEMY
	case POWERFUL_PERSON_ENEMY
	case GOVERNMENT_PERSON_ENEMY
	// SWWC_LIFE_EVENTS_ADVENTURE
	case BATTLE
	case QUEST
	case HEIST
	case SURVIVOR
	case EXPLORATION
	case RESCUE
	case DEFEATED_RIVAL
	case SAFARI
	case DISCOVERY
	case SECRET_MISSION
	// SWWC_LIFE_EVENTS_MISFORTUNE
	case BETRAYED
	case LOST_EVERYTHING
	case IMPRISONED
	case LABORATORY_ACCIDENT
	case ABDUCTED
	case TRAMATIC_HORROR
	case HORRIBLE_WOUNDED
	case EVIL_TWIN
	case MARKED
	case RESPONSIBLE
	// SWWC_LIFE_EVENTS_WITNESS
	case PLAGUE
	case NATURAL_DISASTER
	case MAN_MADE_DISASTER
	case ASTRONOMICAL_EVENT
	case FAMINE
	case SUPERNATURAL_EVENT
	case WAR
	case REVOLUTION
	case MAJOR_CLIMATE_CHANGE
	case ECONOMIC_CRASH
	


	var descriptionShort: String { get { return rawValue.capitalized.replacingOccurrences(of: "_", with: " ") } }
	var descriptionLong: String {
		get {
			switch self {
				// Base
				case .NONE: return "None"
				case .JACKPOT: return "Jackpot!"
				case .TAPPED_OUT: return "Tapped out."
				case .LUCKY_STAR: return "Born under a lucky star."
				case .STAR_CROSSED: return "Star-Crossed."
				case .TAKE_A_FRIEND: return "Take yourself a friend."
				case .MAKE_AN_ENEMY: return "Make an enemy."
				case .LIFETIME_ADVENTURE: return "An adventure of an lifetime."
				case .TRAGIC_MISFORTUNE: return "Tragic misfortune."
				case .WITNESS: return "Witness to something..."
				case .ROMANTIC_AFFAIR: return "Raomandtic affair."
				// SWWC_LIFE_EVENTS_JACKPOT
				case .INHERITANCE: return "Inheritance."
				case .HEIRLOOM: return "Heirloom."
				case .FIND: return "Lucky find."
				case .GAMBLE_WON: return "Gambled, and won big."
				case .RELIC: return "Processes one of a kind relic.."
				case .LUCKY_TRADE: return "Lucky trade (or swindle)"
				case .LOVE_TOKEN: return "Token of love."
				case .SPECIAL_ITEM: return "Blessed/Enchanted/Masterwork Item."
				case .FAVOR_OWED_TO_YOU: return "Favor owed to you."
				case .SETTLEMENT_TROPHY: return "Settlement received (or trophy won)."
				// SWWC_LIFE_EVENTS_TAPPED_OUT
				case .ROBBED: return "Robbed."
				case .GAMBLE_LOST: return "Gamble, lost big."
				case .DESTROYED: return "Been destroyed."
				case .LOST: return "Lost."
				case .DEBT: return "In debt."
				case .SWINDLED: return "Swindled (bad trade)."
				case .JUNK: return "Junk"
				case .CURSED: return "Cursed/Sabotaged Item"
				case .FAVOR_YOU_OWED: return "Favor you owed."
				case .BLACKMAILED: return "Blackmail (scandal)."
				// SWWC_LIFE_EVENTS_LUCKY_STAR
				case .LUCKY: return "Lucky."
				case .RICH: return "Rich, or filthy rich."
				case .ALERT: return "Alert."
				case .AMBIDEXTROUS: return "Ambidextrous."
				case .ATTRACTIVE: return "Attractive."
				case .QUICK: return "Quick."
				case .NOBLE: return "Noble"
				case .FAST_HEALER: return "Fast Healer."
				case .BRAWNY: return "Brawny."
				case .BERSERK: return "Berserk."
				// SWWC_LIFE_EVENTS_STAR_CROSSED
				case .CRIPPLING_INJURY: return "Missing limb(s)."
				case .DISFIGURED: return "Disfiguring injury."
				case .ILLNESS: return "Childhood illness."
				case .MENTAL_TRAUMA: return "Phobia or illness, major."
				case .BAD_EYES: return "Bad eyesight."
				case .ADDICTION: return "Additicted."
				case .DEBILITATING_INJURY: return "Debilitating Injury (Lame/Blind/Deaf)."
				case .ALL_THUMBS: return "All thumbs."
				case .CLUELESS: return "Clueless."
				case .QUIRK: return "Has a quirk."
				// SWWC_LIFE_EVENTS_TAKE_A_FRIEND
				case .ENEMY_RIVAL_FRIEND: return "Old enemy or rival."
				case .UNDERWORLD_CONTACT_FRIEND: return "Underworld contact."
				case .OFFICIAL_FRIEND: return "Offical contact."
				case .COMPANION_FRIEND: return "Non-human companion (animal/robot)."
				case .SOCIETY_FRIEND: return "Member of group or society."
				case .MENTOR_FRIEND: return "Mentor."
				case .RICH_RELATIVE: return "Rich relative."
				case .GADGETEER_FRIEND: return "A gadgeteer."
				case .BODY_GUARD_FRIEND: return "Body guard."
				case .HEALER_FRIEND: return "Medical doctor or healer."
				// SWWC_LIFE_EVENTS_MAKE_AN_ENEMY
				case .FRIEND_TO_ENEMY: return "An old friend becomes an enemy."
				case .CHILDHOOD_ENEMY: return "Childhood enemy/rival returns."
				case .LOVER_TO_ENEMY: return "An old lover becomes an enemy."
				case .ENEMY_AGENT: return "Someone from the other side."
				case .TICKED_OFF_ENEMY: return "Someone you ticked off or upset (otherwise friendly or neutral)."
				case .TEAM_MEMBER_ENEMY: return "A team member becomes a enemy."
				case .RELATIVE_ENEMY: return "A relative becomes a enemy."
				case .UNDERWORLD_CRIME_LORD_ENEMY: return "An underworld crime lord."
				case .POWERFUL_PERSON_ENEMY: return "A powerful individual."
				case .GOVERNMENT_PERSON_ENEMY: return "A government leader is an enemy."
				// SWWC_LIFE_EVENTS_ADVENTURE
				case .BATTLE: return "A battle, or war."
				case .QUEST: return "A quest"
				case .HEIST: return "Heist (crime of the century)"
				case .SURVIVOR: return "Survivor."
				case .EXPLORATION: return "Exploration"
				case .RESCUE: return "A rescue"
				case .DEFEATED_RIVAL: return "Defeated personal rival."
				case .SAFARI: return "A safari"
				case .DISCOVERY: return "An Amazing Discovery"
				case .SECRET_MISSION: return "A secret mission"
				// SWWC_LIFE_EVENTS_MISFORTUNE
				case .BETRAYED: return "Betrayed (Ally turned Enemy)"
				case .LOST_EVERYTHING: return "Lost everything"
				case .IMPRISONED: return "Been Imprisoned."
				case .LABORATORY_ACCIDENT: return "Laboratory accident."
				case .ABDUCTED: return "Been abducted."
				case .TRAMATIC_HORROR: return "Tramatic horror."
				case .HORRIBLE_WOUNDED: return "Horribly wounded."
				case .EVIL_TWIN: return "Evil twin, identity stolen."
				case .MARKED: return "Price on your head/marked."
				case .RESPONSIBLE: return "Responsible for death of team/family/village."
				// SWWC_LIFE_EVENTS_WITNESS
				case .PLAGUE: return "Plague."
				case .NATURAL_DISASTER: return "Natural disaster."
				case .MAN_MADE_DISASTER: return "Man made disaster."
				case .ASTRONOMICAL_EVENT: return "Astronmical event."
				case .FAMINE: return "Famine."
				case .SUPERNATURAL_EVENT: return "Supernatural event."
				case .WAR: return "War."
				case .REVOLUTION: return "Revolution."
				case .MAJOR_CLIMATE_CHANGE: return "Sudden Major Climatic Change"
				case .ECONOMIC_CRASH: return "Major Economic Crash."
			}
		}
	}

//	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS {
//		switch value {
//			case 1: return .JACKPOT
//			case 2: return .TAPPED_OUT
//			case 3: return .LUCKY_STAR
//			case 4: return .STAR_CROSSED
//			case 5: return .TAKE_A_FRIEND
//			case 6: return .MAKE_AN_ENEMY
//			case 7: return .LIFETIME_ADVENTURE
//			case 8: return .TRAGIC_MISFORTUNE
//			case 9: return .WITNESS
//			case 10: return .ROMANTIC_AFFAIR
//			default: return .NONE
//		}
//	}

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS {
		switch value {
			case 1: return getRandomJackpot()
			case 2: return getRandomTappledOut()
			case 3: return getRandomLuckyStar()
			case 4: return getRandomStarCrossed()
			case 5: return getRandomTakeAFriend()
			case 6: return getRandomMakeAnEnemy()
			case 7: return getRandomLifeAdventure()
			case 8: return getRandomLifeMisfortune()
			case 9: return getRandomLifeEventWitness()
			case 10: return .ROMANTIC_AFFAIR
			default: return .NONE
		}
	}

	static func getRandomJackpot() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 21...30)
		switch value {
			case 21: return .INHERITANCE
			case 22: return .HEIRLOOM
			case 23: return .FIND
			case 24: return .GAMBLE_WON
			case 25: return .RELIC
			case 26: return .LUCKY_TRADE
			case 27: return .LOVE_TOKEN
			case 28: return .SPECIAL_ITEM
			case 29: return .FAVOR_OWED_TO_YOU
			case 30: return .SETTLEMENT_TROPHY
			default: return .NONE
		}
	}

	static func getRandomTappledOut() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 31...40)
		switch value {
			case 31: return .ROBBED
			case 32: return .GAMBLE_LOST
			case 33: return .DESTROYED
			case 34: return .LOST
			case 35: return .DEBT
			case 36: return .SWINDLED
			case 37: return .JUNK
			case 38: return .CURSED
			case 39: return .FAVOR_YOU_OWED
			case 40: return .BLACKMAILED
			default: return .NONE
		}
	}

	static func getRandomLuckyStar() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 51...60)
		switch value {
			case 51: return .LUCKY
			case 52: return .RICH
			case 53: return .ALERT
			case 54: return .AMBIDEXTROUS
			case 55: return .ATTRACTIVE
			case 56: return .QUICK
			case 57: return .NOBLE
			case 58: return .FAST_HEALER
			case 59: return .BRAWNY
			case 60: return .BERSERK
			default: return .NONE
		}
	}

	static func getRandomStarCrossed() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 61...70)
		switch value {
			case 61: return .CRIPPLING_INJURY
			case 62: return .DISFIGURED
			case 63: return .ILLNESS
			case 64: return .MENTAL_TRAUMA
			case 65: return .BAD_EYES
			case 66: return .ADDICTION
			case 67: return .DEBILITATING_INJURY
			case 68: return .ALL_THUMBS
			case 69: return .CLUELESS
			case 70: return .QUIRK
			default: return .NONE
		}
	}

	static func getRandomTakeAFriend() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 71...80)
		switch value {
			case 71: return .ENEMY_RIVAL_FRIEND
			case 72: return .UNDERWORLD_CONTACT_FRIEND
			case 73: return .OFFICIAL_FRIEND
			case 74: return .COMPANION_FRIEND
			case 75: return .SOCIETY_FRIEND
			case 76: return .MENTOR_FRIEND
			case 77: return .RICH_RELATIVE
			case 78: return .GADGETEER_FRIEND
			case 79: return .BODY_GUARD_FRIEND
			case 80: return .HEALER_FRIEND
			default: return .NONE
		}
	}

	static func getRandomMakeAnEnemy() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 81...90)
		switch value {
			case 81: return .FRIEND_TO_ENEMY
			case 82: return .CHILDHOOD_ENEMY
			case 83: return .LOVER_TO_ENEMY
			case 84: return .ENEMY_AGENT
			case 85: return .TICKED_OFF_ENEMY
			case 86: return .TEAM_MEMBER_ENEMY
			case 87: return .RELATIVE_ENEMY
			case 88: return .UNDERWORLD_CRIME_LORD_ENEMY
			case 89: return .POWERFUL_PERSON_ENEMY
			case 90: return .GOVERNMENT_PERSON_ENEMY
			default: return .NONE
		}
	}

	static func getRandomLifeAdventure() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 91...100)
		switch value {
			case 91: return .BATTLE
			case 92: return .QUEST
			case 93: return .HEIST
			case 94: return .SURVIVOR
			case 95: return .EXPLORATION
			case 96: return .RESCUE
			case 97: return .DEFEATED_RIVAL
			case 98: return .SAFARI
			case 99: return .DISCOVERY
			case 100: return .SECRET_MISSION
			default: return .NONE
		}
	}

	static func getRandomLifeMisfortune() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 101...110)
		switch value {
			case 101: return .BETRAYED
			case 102: return .LOST_EVERYTHING
			case 103: return .IMPRISONED
			case 104: return .LABORATORY_ACCIDENT
			case 105: return .ABDUCTED
			case 106: return .TRAMATIC_HORROR
			case 107: return .HORRIBLE_WOUNDED
			case 108: return .EVIL_TWIN
			case 109: return .MARKED
			case 110: return .RESPONSIBLE
			default: return .NONE
		}
	}

	static func getRandomLifeEventWitness() -> SWWC_LIFE_EVENTS {
		let value = Int.random(in: 111...120)
		switch value {
			case 111: return .PLAGUE
			case 112: return .NATURAL_DISASTER
			case 113: return .MAN_MADE_DISASTER
			case 114: return .ASTRONOMICAL_EVENT
			case 115: return .FAMINE
			case 116: return .SUPERNATURAL_EVENT
			case 117: return .WAR
			case 118: return .REVOLUTION
			case 119: return .MAJOR_CLIMATE_CHANGE
			case 120: return .ECONOMIC_CRASH
			default: return .NONE
		}
	}

}



// MARK: - MAKE_AN_ENEMY

enum SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_CAUSE: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_CAUSE

	static var MIN: Int = 1
	static var MAX: Int = 10

	case LOSE_FACE = "Caused loss of face or status."
	case LOST_LOVER = "Caused a loss of a lover, friend, relative."
	case HUMILITATION = "Caused humilitation."
	case COWARD_FLAW = "Accused of cowardice or personal flaw."
	case DISABILITY = "Caused a disability."
	case DESERTED_BETRAYED = "Deserted or betrayed the other."
	case DECLINED = "Turned down job or romantic involvement."
	case DISLIKE = "General dislike of the other."
	case ROMANTIC_RIVAL = "Was a romantic rival."
	case FOILED = "Foiled plan of the other."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_CAUSE {
		switch value {
			case 1: return .LOSE_FACE
			case 2: return .LOST_LOVER
			case 3: return .HUMILITATION
			case 4: return .COWARD_FLAW
			case 5: return .DISABILITY
			case 6: return .DESERTED_BETRAYED
			case 7: return .DECLINED
			case 8: return .DISLIKE
			case 9: return .ROMANTIC_RIVAL
			case 10: return .FOILED
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_DIRECTION: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_DIRECTION

	static var MIN: Int = 1
	static var MAX: Int = 10

	case THEY_HATE_YOU = "They hate you."
	case YOU_HATE_THEM = "You hate them."
	case MUTUAL = "Feeling's mutual."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_DIRECTION {
		switch value {
			case 1...4: return .THEY_HATE_YOU
			case 5...7: return .YOU_HATE_THEM
			case 8...10: return .MUTUAL
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_ACTION: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_ACTION

	static var MIN: Int = 1
	static var MAX: Int = 10

	case RAGE = "Go into a murderous rage."
	case AVOID = "Avoids them."
	case BACKSTAB = "Backstab them indirectly."
	case IGNORE = "Ignore them."
	case TELL_OFF = "Attack them verbally."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_ACTION {
		switch value {
			case 1...2: return .RAGE
			case 3...4: return .AVOID
			case 5...6: return .BACKSTAB
			case 7...8: return .IGNORE
			case 9...10: return .TELL_OFF
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_TOOLS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_TOOLS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case THEMSELVES = "Just themselves"
	case THEM_AND_FRIENDS = "Themselves and a few friends."
	case THE_GANG = "Their entire game."
	case SMALL_ARMY = "Small Army."
	case LARGE_ARMY = "Large Army"
	case SOCIETY = "An entire race or world"
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_MAKE_AN_ENEMY_TOOLS {
		switch value {
			case 1...3: return .THEMSELVES
			case 4...5: return .THEM_AND_FRIENDS
			case 5...7: return .THE_GANG
			case 8: return .SMALL_ARMY
			case 9: return .LARGE_ARMY
			case 10: return .SOCIETY
			default: return .NONE
		}
	}
}


// MARK: - LIFE_EVENTS

enum SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case HAPPY_LOVE_AFFAIR = "Happy love affair."
	case TRAGIC_LOVE_AFFAIR = "Tragic love affair."
	case LOVE_AFFAIR_WITH_PROBLEMS = "Love affair with problems."
	case FAST_AFFAIR = "Fast affair, one night stands."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS {
		switch value {
			case 1...4: return .HAPPY_LOVE_AFFAIR
			case 5: return .TRAGIC_LOVE_AFFAIR
			case 6...7: return .LOVE_AFFAIR_WITH_PROBLEMS
			case 8...10: return .FAST_AFFAIR
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_TRAGIC: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_TRAGIC

	static var MIN: Int = 1
	static var MAX: Int = 10

	case DIED_IN_ACCIDENT = "Lover died in accident."
	case VANISHED = "Lover vanished."
	case DID_NOT_WORK_OUT = "Didn't work out."
	case A_PERSONAL_GOAL = "A personal goal or vendetta came between you."
	case STOLEN = "Lover stolen away (kidnapped or infatuated.)"
	case ILLNESS = "Lover went insane or became ill and passed on."
	case SUICIDE = "Lover committed suicide."
	case FIGHT = "Lover killed in a fight."
	case CUT_OFF = "Lover cut you out of the action."
	case BANISHED = "Lover imprisoned or exiled."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_TRAGIC {
		switch value {
			case 1: return .DIED_IN_ACCIDENT
			case 2: return .VANISHED
			case 3: return .DID_NOT_WORK_OUT
			case 4: return .A_PERSONAL_GOAL
			case 5: return .STOLEN
			case 6: return .ILLNESS
			case 7: return .SUICIDE
			case 8: return .FIGHT
			case 9: return .CUT_OFF
			case 10: return .BANISHED
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_WITH_PROBLEMS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_WITH_PROBLEMS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case THEY_HATE = "Lover’s friends/family hate you."
	case POSSESIVE = "Lover’s friends/family would use any means to get rid of you"
	case YOURS_HATE = "Your friends/family hate your lover"
	case RIVAL = "One of you has a romantic rival."
	case SEPERATED = "You are separated in some way."
	case FIGHTING = "You fight constantly."
	case PROFESSIONAL_RIVALS = "You are professional rivals."
	case JEALOUSY = "One of you is insanely jealous."
	case UNFAITHFUL = "One of you is unfaithful."
	case STAR_CROSSED = "You have conflicting backgrounds and/or families."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_WITH_PROBLEMS {
		switch value {
			case 1: return .THEY_HATE
			case 2: return .POSSESIVE
			case 3: return .YOURS_HATE
			case 4: return .RIVAL
			case 5: return .SEPERATED
			case 6: return .FIGHTING
			case 7: return .PROFESSIONAL_RIVALS
			case 8: return .JEALOUSY
			case 9: return .UNFAITHFUL
			case 10: return .STAR_CROSSED
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_MUTUAL_FEELINGS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_MUTUAL_FEELINGS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case THEY_LOVE_YOU = "They still love you."
	case YOU_LOVE_THEM = "You still love them."
	case BOTH_LOVE = "You still love each other."
	case HATE_THEM = "You hate them."
	case HATE_YOU = "They hate you."
	case BOTH_HATE = "You hate each other."
	case STILL_FRIENDS = "You are still friends."
	case NO_FEELINGS = "No feelings either way, it's over."
	case YOU_LIKE_THEY_HATE = "You like them, they hate you"
	case YOU_HATE_THEY_LIKE = "They like you, you hate them."
	case NONE

	var descriptionShort: String { get { return rawValue } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS_MUTUAL_FEELINGS {
		switch value {
			case 1: return .THEY_LOVE_YOU
			case 2: return .YOU_LOVE_THEM
			case 3: return .BOTH_LOVE
			case 4: return .HATE_THEM
			case 5: return .HATE_YOU
			case 6: return .BOTH_HATE
			case 7: return .STILL_FRIENDS
			case 8: return .NO_FEELINGS
			case 9: return .YOU_LIKE_THEY_HATE
			case 10: return .YOU_HATE_THEY_LIKE
			default: return .NONE
		}
	}
}
