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

}




enum SWWC_SIBLING_BIOLOGICAL_SEX: String, RPG_TABLE, Codable {
	typealias Result = SWWC_SIBLING_BIOLOGICAL_SEX

	static var MIN: Int = 1
	static var MAX: Int = 2

	case MALE
	case FEMALE
	case NONE

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

	case FOURTUNE = "Childhood had a fortunate event."
	case TRAUMA = "Childhood had a unfortunate trauma."
	case MUDANE = "Childhood was uneventful."
	case NONE

	static func getElementBy(value: Int) -> SWWC_CHILDHOOD_EVENTS {
		switch value {
			case 1...4: return .FOURTUNE
			case 5...6: return .MUDANE
			case 7...10: return .TRAUMA
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

enum SWWV_PERSONALITY_TYPE: String, RPG_TABLE, Codable {

	typealias Result = SWWV_PERSONALITY_TYPE

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

	static func getElementBy(value: Int) -> SWWV_PERSONALITY_TYPE {
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


	static func getValueOfPersonalityType(_ type: SWWV_PERSONALITY_TYPE) -> Int {
		switch type {
			case .EXTROVERTED_VAPID, .EXTROVERTED_FRIENDLY: return 1
			case .CASUAL, .MOODY: return 2
			case .INTROVERTED_STABLE, .INTROVERTED_ALOOF: return 2
			case .INTROVERTED_INTELLECTUAL, .SCHEMING: return 4
			case .COLD, .PSYCHOPATH: return 5
			default: return 0
		}
	}

}

enum SWWV_PHILOSPHY_TYPE: String, RPG_TABLE, Codable {

	typealias Result = SWWV_PHILOSPHY_TYPE

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

	static func getElementBy(value: Int) -> SWWV_PHILOSPHY_TYPE {
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

	static func getPhilosophyWithPersonality(_ personality: SWWV_PERSONALITY_TYPE) -> SWWV_PHILOSPHY_TYPE {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PERSONALITY_TYPE.getValueOfPersonalityType(personality) + Int.random(in: 1...10, using: &SRNG)

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

	static func getValueOfPhilosphyType(_ type: SWWV_PHILOSPHY_TYPE) -> Int {
		switch type {
			case .LOVE, .GOOD_TIME: return 1
			case .FRIENDSHIP, .HONESTY: return 2
			case .HONOR, .MONEY: return 2
			case .POWER, .REVENGE: return 4
			case .SURVIVAL, .CHAOS: return 5
			default: return 0
		}
	}


}


enum SWWV_WHO_YOU_VALUE_MOST: String, RPG_TABLE, Codable {

	typealias Result = SWWV_WHO_YOU_VALUE_MOST

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

	static func getElementBy(value: Int) -> SWWV_WHO_YOU_VALUE_MOST {
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

	static func getPersonValuedByPersonality(_ personality: SWWV_PERSONALITY_TYPE) -> SWWV_WHO_YOU_VALUE_MOST {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PERSONALITY_TYPE.getValueOfPersonalityType(personality) + Int.random(in: 1...10, using: &SRNG)

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

	static func getPersonValuedByPhilosphy(_ philosphy: SWWV_PHILOSPHY_TYPE) -> SWWV_WHO_YOU_VALUE_MOST {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PHILOSPHY_TYPE.getValueOfPhilosphyType(philosphy) + Int.random(in: 1...10, using: &SRNG)

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



enum SWWV_MOST_VALUED_POSSESSION: String, RPG_TABLE, Codable {

	typealias Result = SWWV_MOST_VALUED_POSSESSION

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

	static func getElementBy(value: Int) -> SWWV_MOST_VALUED_POSSESSION {
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

	static func getMVPByPersonality(_ personality: SWWV_PERSONALITY_TYPE) -> SWWV_MOST_VALUED_POSSESSION {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PERSONALITY_TYPE.getValueOfPersonalityType(personality) + Int.random(in: 1...10, using: &SRNG)

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

	static func getMVPByPhilosphy(_ philosphy: SWWV_PHILOSPHY_TYPE) -> SWWV_MOST_VALUED_POSSESSION {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PHILOSPHY_TYPE.getValueOfPhilosphyType(philosphy) + Int.random(in: 1...10, using: &SRNG)

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



enum SWWV_MOTIVATION: String, RPG_TABLE, Codable {

	typealias Result = SWWV_MOTIVATION

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

	static func getElementBy(value: Int) -> SWWV_MOTIVATION {
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

	static func getMVPByPersonality(_ personality: SWWV_PERSONALITY_TYPE) -> SWWV_MOTIVATION {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PERSONALITY_TYPE.getValueOfPersonalityType(personality) + Int.random(in: 1...10, using: &SRNG)

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

	static func getMVPByPhilosphy(_ philosphy: SWWV_PHILOSPHY_TYPE) -> SWWV_MOTIVATION {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PHILOSPHY_TYPE.getValueOfPhilosphyType(philosphy) + Int.random(in: 1...10, using: &SRNG)

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



enum SWWV_WORLDVIEW: String, RPG_TABLE, Codable {

	typealias Result = SWWV_WORLDVIEW

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

	static func getElementBy(value: Int) -> SWWV_WORLDVIEW {
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

	static func getMVPByPersonality(_ personality: SWWV_PERSONALITY_TYPE) -> SWWV_WORLDVIEW {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PERSONALITY_TYPE.getValueOfPersonalityType(personality) + Int.random(in: 1...10, using: &SRNG)

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

	static func getMVPByPhilosphy(_ philosphy: SWWV_PHILOSPHY_TYPE) -> SWWV_WORLDVIEW {
		var SRNG = SystemRandomNumberGenerator()
		let result = SWWV_PHILOSPHY_TYPE.getValueOfPhilosphyType(philosphy) + Int.random(in: 1...10, using: &SRNG)

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


enum SWWC_LIFE_EVENTS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case JACKPOT = "Jackpot!"
	case TAPPED_OUT = "Tapped out."
	case LUCKY_STAR = "Born under a lucky star."
	case STAR_CROSSED = "Star-Crossed."
	case TAKE_A_FRIEND = "Take yourself a friend."
	case MAKE_AN_ENEMY = "Make an enemy."
	case LIFETIME_ADVENTURE = "An adventure of an lifetime."
	case TRAGIC_MISFORTUNE = "Tragic misfortune."
	case WITNESS = "Witness to something..."
	case ROMANTIC_AFFAIR = "Raomandtic affair."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS {
		switch value {
			case 1: return .JACKPOT
			case 2: return .TAPPED_OUT
			case 3: return .LUCKY_STAR
			case 4: return .STAR_CROSSED
			case 5: return .TAKE_A_FRIEND
			case 6: return .MAKE_AN_ENEMY
			case 7: return .LIFETIME_ADVENTURE
			case 8: return .TRAGIC_MISFORTUNE
			case 9: return .WITNESS
			case 10: return .ROMANTIC_AFFAIR
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_JACKPOT: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_JACKPOT

	static var MIN: Int = 1
	static var MAX: Int = 10

	case INHERITANCE = "Inheritance."
	case HEIRLOOM = "Heirloom."
	case FIND = "Lucky find."
	case GAMBLE = "Gambled, and won big."
	case RELIC = "Processes one of a kind relic.."
	case LUCKY_TRADE = "Lucky trade (or swindle)"
	case LOVE_TOKEN = "Token of love."
	case SPECIAL_ITEM = "Blessed/Enchanted/Masterwork Item."
	case FAVOR = "Favor owed to you."
	case SETTLEMENT_TROPHY = "Settlement received (or trophy won)."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_JACKPOT {
		switch value {
			case 1: return .INHERITANCE
			case 2: return .HEIRLOOM
			case 3: return .FIND
			case 4: return .GAMBLE
			case 5: return .RELIC
			case 6: return .LUCKY_TRADE
			case 7: return .LOVE_TOKEN
			case 8: return .SPECIAL_ITEM
			case 9: return .FAVOR
			case 10: return .SETTLEMENT_TROPHY
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_TAPPED_OUT: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_TAPPED_OUT

	static var MIN: Int = 1
	static var MAX: Int = 10

	case ROBBED = "Robbed."
	case GAMBLE = "Gamble, lost big."
	case DESTROYED = "Been destroyed."
	case LOST = "Lost."
	case DEBT = "In debt."
	case SWINDLED = "Swindled (bad trade)."
	case JUNK = "Junk"
	case CURSED = "Cursed/Sabotaged Item"
	case FAVOR = "Favor you owed."
	case BLACKMAILED = "Blackmail (scandal)."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_TAPPED_OUT {
		switch value {
			case 1: return .ROBBED
			case 2: return .GAMBLE
			case 3: return .DESTROYED
			case 4: return .LOST
			case 5: return .DEBT
			case 6: return .SWINDLED
			case 7: return .JUNK
			case 8: return .CURSED
			case 9: return .FAVOR
			case 10: return .BLACKMAILED
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_LUCKY_STAR: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_LUCKY_STAR

	static var MIN: Int = 1
	static var MAX: Int = 10

	case LUCKY = "Lucky."
	case RICH = "Rich, or filthy rich."
	case ALERT = "Alert."
	case AMBIDEXTROUS = "Ambidextrous."
	case ATTRACTIVE = "Attractive."
	case QUICK = "Quick."
	case NOBLE = "Noble"
	case FAST_HEALER = "Fast Healer."
	case BRAWNY = "Brawny."
	case BERSERK = "Berserk."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_LUCKY_STAR {
		switch value {
			case 1: return .LUCKY
			case 2: return .RICH
			case 3: return .ALERT
			case 4: return .AMBIDEXTROUS
			case 5: return .ATTRACTIVE
			case 6: return .QUICK
			case 7: return .NOBLE
			case 8: return .FAST_HEALER
			case 9: return .BRAWNY
			case 10: return .BERSERK
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_STAR_CROSSED: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_STAR_CROSSED

	static var MIN: Int = 1
	static var MAX: Int = 10

	case CRIPPLING_INJURY = "Missing limb(s)."
	case DISFIGURED = "Disfiguring injury."
	case ILLNESS = "Childhood illness."
	case MENTAL_TRAUMA = "Phobia or illness, major."
	case BAD_EYES = "Bad eyesight."
	case ADDICTION = "Additicted."
	case DEBILITATING_INJURY = "Debilitating Injury (Lame/Blind/Deaf)."
	case ALL_THUMBS = "All thumbs."
	case CLUELESS = "Clueless."
	case QUIRK = "Has a quirk."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_STAR_CROSSED {
		switch value {
			case 1: return .CRIPPLING_INJURY
			case 2: return .DISFIGURED
			case 3: return .ILLNESS
			case 4: return .MENTAL_TRAUMA
			case 5: return .BAD_EYES
			case 6: return .ADDICTION
			case 7: return .DEBILITATING_INJURY
			case 8: return .ALL_THUMBS
			case 9: return .CLUELESS
			case 10: return .QUIRK
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_TAKE_A_FRIEND: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_TAKE_A_FRIEND

	static var MIN: Int = 1
	static var MAX: Int = 10

	case ENEMY_RIVAL = "Old enemy or rival."
	case UNDERWORLD = "Underworld contact."
	case OFFICIAL = "Offical contact."
	case COMPANION = "Non-human companion (animal/robot)."
	case SOCIETY = "Member of group or society."
	case MENTOR = "Mentor."
	case RICH_RELATIVE = "Rich relative."
	case GADGETEER = "A gadgeteer."
	case BODY_GUARD = "Body guard."
	case HEALER = "Medical doctor or healer."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_TAKE_A_FRIEND {
		switch value {
			case 1: return .ENEMY_RIVAL
			case 2: return .UNDERWORLD
			case 3: return .OFFICIAL
			case 4: return .COMPANION
			case 5: return .SOCIETY
			case 6: return .MENTOR
			case 7: return .RICH_RELATIVE
			case 8: return .GADGETEER
			case 9: return .BODY_GUARD
			case 10: return .HEALER
			default: return .NONE
		}
	}
}


enum SWWC_LIFE_EVENTS_MAKE_AN_ENEMY: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_MAKE_AN_ENEMY

	static var MIN: Int = 1
	static var MAX: Int = 10

	case FRIEND_TO_ENEMY = "An old friend becomes an enemy."
	case CHILDHOOD_ENEMY = "Childhood enemy/rival returns."
	case LOVER_TO_ENEMY = "An old lover becomes an enemy."
	case ENEMY_AGENT = "Someone from the other side."
	case TICKED_OFF = "Someone you ticked off or upset (otherwise friendly or neutral)."
	case TEAM_MEMBER = "A team member becomes a enemy."
	case RELATIVE = "A relative becomes a enemy."
	case UNDERWORLD = "An underworld crime lord."
	case POWERFUL_PERSON = "A powerful individual."
	case GOVERNMENT_PERSON = "A government leader is an enemy."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_MAKE_AN_ENEMY {
		switch value {
			case 1: return .FRIEND_TO_ENEMY
			case 2: return .CHILDHOOD_ENEMY
			case 3: return .LOVER_TO_ENEMY
			case 4: return .ENEMY_AGENT
			case 5: return .TICKED_OFF
			case 6: return .TEAM_MEMBER
			case 7: return .RELATIVE
			case 8: return .UNDERWORLD
			case 9: return .POWERFUL_PERSON
			case 10: return .GOVERNMENT_PERSON
			default: return .NONE
		}
	}
}


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

enum SWWC_LIFE_EVENTS_ADVENTURE: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ADVENTURE

	static var MIN: Int = 1
	static var MAX: Int = 10

	case BATTLE = "A battle, or war."
	case QUEST = "A quest"
	case HEIST = "Heist (crime of the century)"
	case SURVIVOR = "Survivor."
	case EXPLORATION = "Exploration"
	case RESCUE = "A rescue"
	case DEFEATED_RIVAL = "Defeated personal rival."
	case SAFARI = "A safari"
	case DISCOVERY = "An Amazing Discovery"
	case SECRET_MISSION = "A secret ,ission"
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_ADVENTURE {
		switch value {
			case 1: return .BATTLE
			case 2: return .QUEST
			case 3: return .HEIST
			case 4: return .SURVIVOR
			case 5: return .EXPLORATION
			case 6: return .RESCUE
			case 7: return .DEFEATED_RIVAL
			case 8: return .SAFARI
			case 9: return .DISCOVERY
			case 10: return .SECRET_MISSION
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_MISFORTUNE: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ADVENTURE

	static var MIN: Int = 1
	static var MAX: Int = 10

	case BETRAYED = "Betrayed (Ally turned Enemy)"
	case LOST_EVERYTHING = "Lost everything"
	case IMPRISONED = "Been Imprisoned."
	case LABORATORY_ACCIDENT = "Laboratory accident."
	case ABDUCTED = "Been abducted."
	case TRAMATIC_HORROR = "Tramatic horror."
	case HORRIBLE_WOUNDED = "Horribly wounded."
	case EVIL_TWIN = "Evil twin, identity stolen."
	case MARKED = "Price on your head/marked."
	case RESPONSIBLE = "Responsible for death of team/family/village."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_ADVENTURE {
		switch value {
			case 1: return .BATTLE
			case 2: return .QUEST
			case 3: return .HEIST
			case 4: return .SURVIVOR
			case 5: return .EXPLORATION
			case 6: return .RESCUE
			case 7: return .DEFEATED_RIVAL
			case 8: return .SAFARI
			case 9: return .DISCOVERY
			case 10: return .SECRET_MISSION
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_WITNESS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_WITNESS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case PLAGUE = "Plague."
	case NATURAL_DISASTER = "Natural disaster."
	case MAN_MADE_DISASTER = "Man made disaster."
	case ASTRONOMICAL_EVENT = "Astronmical event."
	case FAMINE = "Famine."
	case SUPERNATURAL_EVENT = "Supernatural event."
	case WAR = "War."
	case REVOLUTION = "Revolution."
	case MAJOR_CLIMATE_CHANGE = "Sudden Major Climatic Change"
	case ECONOMIC_CRASH = "Major Economic Crash."
	case NONE

	static func getElementBy(value: Int) -> SWWC_LIFE_EVENTS_WITNESS {
		switch value {
			case 1: return .PLAGUE
			case 2: return .NATURAL_DISASTER
			case 3: return .MAN_MADE_DISASTER
			case 4: return .ASTRONOMICAL_EVENT
			case 5: return .FAMINE
			case 6: return .SUPERNATURAL_EVENT
			case 7: return .WAR
			case 8: return .REVOLUTION
			case 9: return .MAJOR_CLIMATE_CHANGE
			case 10: return .ECONOMIC_CRASH
			default: return .NONE
		}
	}
}

enum SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS: String, RPG_TABLE, Codable {
	typealias Result = SWWC_LIFE_EVENTS_ROMANTIC_AFFAIRS

	static var MIN: Int = 1
	static var MAX: Int = 10

	case HAPPY_LOVE_AFFAIR = "Happy love affair."
	case TRAGIC_LOVE_AFFAIR = "Tragic love affair."
	case LOVE_AFFAIR_WITH_PROBLEMS = "Love affair with problems."
	case FAST_AFFAIR = "Fast affair, one night stands."
	case NONE

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
