//
//  UNEOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class UNEGeneratorModel {
	
}


enum UNE_NPC_MODIFIER: String, RPG_TABLE {
	typealias Result = UNE_NPC_MODIFIER

	static var MIN: Int = 1
	static var MAX: Int = 100

	case SUPERFLUOUS
	case ADDICTED
	case CONFORMIST
	case NEFARIOUS
	case SENSIBLE
	case UNTRAINED
	case ROMANTIC
	case UNREASONABLE
	case SKILLED
	case NEGLECTFUL
	case LIVELY
	case FORTHRIGHT
	case IDEALISTIC
	case UNSUPPORTIVE
	case RATIONAL
	case COARSE
	case FOOLISH
	case CUNNING
	case DELIGHTFUL
	case MISERLY
	case INEPT
	case BANAL
	case LOGICAL
	case SUBTLE
	case REPUTABLE
	case WICKED
	case LAZY
	case PESSIMISTIC
	case SOLEMN
	case HABITUAL
	case MEEK
	case HELPFUL
	case UNCONCERNED
	case GENEROUS
	case DOCILE
	case CHEERY
	case PRAGMATIC
	case SERENE
	case THOUGHTFUL
	case HOPELESS
	case PLEASANT
	case INSENSITIVE
	case TITLED
	case INEXPERIENCED
	case PRYING
	case OBLIVIOUS
	case REFINED
	case INDISPENSABLE
	case SCHOLARLY
	case CONSERVATIVE
	case UNCOUTH
	case WILLFUL
	case INDIFFERENT
	case FICKLE
	case ELDERLY
	case SINFUL
	case NAIVE
	case PRIVILEGED
	case GLUM
	case LIKABLE
	case LETHARGIC
	case DEFIANT
	case OBNOXIOUS
	case INSIGHTFUL
	case TACTLESS
	case FANATIC
	case PLEBEIAN
	case CHILDISH
	case PIOUS
	case UNEDUCATED
	case INCONSIDERATE
	case CULTURED
	case REVOLTING
	case CURIOUS
	case TOUCHY
	case NEEDY
	case DIGNIFIED
	case PUSHY
	case KIND
	case CORRUPT
	case JOVIAL
	case SHREWD
	case LIBERAL
	case COMPLIANT
	case DESTITUTE
	case CONNIVING
	case CAREFUL
	case ALLURING
	case DEFECTIVE
	case OPTIMISTIC
	case AFFLUENT
	case DESPONDENT
	case MINDLESS
	case PASSIONATE
	case DEVOTED
	case ESTABLISHED
	case UNSEEMLY
	case DEPENDABLE
	case RIGHTEOUS
	case CONFIDENT
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_MODIFIER {
		switch value {
			case 1: return .SUPERFLUOUS
			case 2: return .ADDICTED
			case 3: return .CONFORMIST
			case 4: return .NEFARIOUS
			case 5: return .SENSIBLE
			case 6: return .UNTRAINED
			case 7: return .ROMANTIC
			case 8: return .UNREASONABLE
			case 9: return .SKILLED
			case 10: return .NEGLECTFUL
			case 11: return .LIVELY
			case 12: return .FORTHRIGHT
			case 13: return .IDEALISTIC
			case 14: return .UNSUPPORTIVE
			case 15: return .RATIONAL
			case 16: return .COARSE
			case 17: return .FOOLISH
			case 18: return .CUNNING
			case 19: return .DELIGHTFUL
			case 20: return .MISERLY
			case 21: return .INEPT
			case 22: return .BANAL
			case 23: return .LOGICAL
			case 24: return .SUBTLE
			case 25: return .REPUTABLE
			case 26: return .WICKED
			case 27: return .LAZY
			case 28: return .PESSIMISTIC
			case 29: return .SOLEMN
			case 30: return .HABITUAL
			case 31: return .MEEK
			case 32: return .HELPFUL
			case 33: return .UNCONCERNED
			case 34: return .GENEROUS
			case 35: return .DOCILE
			case 36: return .CHEERY
			case 37: return .PRAGMATIC
			case 38: return .SERENE
			case 39: return .THOUGHTFUL
			case 40: return .HOPELESS
			case 41: return .PLEASANT
			case 42: return .INSENSITIVE
			case 43: return .TITLED
			case 44: return .INEXPERIENCED
			case 45: return .PRYING
			case 46: return .OBLIVIOUS
			case 47: return .REFINED
			case 48: return .INDISPENSABLE
			case 49: return .SCHOLARLY
			case 50: return .CONSERVATIVE
			case 51: return .UNCOUTH
			case 52: return .WILLFUL
			case 53: return .INDIFFERENT
			case 54: return .FICKLE
			case 55: return .ELDERLY
			case 56: return .SINFUL
			case 57: return .NAIVE
			case 58: return .PRIVILEGED
			case 59: return .GLUM
			case 60: return .LIKABLE
			case 61: return .LETHARGIC
			case 62: return .DEFIANT
			case 63: return .OBNOXIOUS
			case 64: return .INSIGHTFUL
			case 65: return .TACTLESS
			case 66: return .FANATIC
			case 67: return .PLEBEIAN
			case 68: return .CHILDISH
			case 69: return .PIOUS
			case 70: return .UNEDUCATED
			case 71: return .INCONSIDERATE
			case 72: return .CULTURED
			case 73: return .REVOLTING
			case 74: return .CURIOUS
			case 75: return .TOUCHY
			case 76: return .NEEDY
			case 77: return .DIGNIFIED
			case 78: return .PUSHY
			case 79: return .KIND
			case 80: return .CORRUPT
			case 81: return .JOVIAL
			case 82: return .SHREWD
			case 83: return .LIBERAL
			case 84: return .COMPLIANT
			case 85: return .DESTITUTE
			case 86: return .CONNIVING
			case 87: return .CAREFUL
			case 88: return .ALLURING
			case 89: return .DEFECTIVE
			case 90: return .OPTIMISTIC
			case 91: return .AFFLUENT
			case 92: return .DESPONDENT
			case 93: return .MINDLESS
			case 94: return .PASSIONATE
			case 95: return .DEVOTED
			case 96: return .ESTABLISHED
			case 97: return .UNSEEMLY
			case 98: return .DEPENDABLE
			case 99: return .RIGHTEOUS
			case 100: return .CONFIDENT
			default: return .NONE
		}
	}
}


enum UNE_NPC_NOUN: String, RPG_TABLE {
	typealias Result = UNE_NPC_NOUN

	static var MIN: Int = 1
	static var MAX: Int = 100

	case GYPSY
	case WITCH
	case MERCHANT
	case EXPERT
	case COMMONER
	case JUDGE
	case RANGER
	case OCCULTIST
	case REVEREND
	case THUG
	case DRIFTER
	case JOURNEYMAN
	case STATESMAN
	case ASTROLOGER
	case DUELIST
	case JACK_OF_ALL_TRADES
	case ARISTOCRAT
	case PREACHER
	case ARTISAN
	case ROGUE
	case MISSIONARY
	case OUTCAST
	case MERCENARY
	case CARETAKER
	case HERMIT
	case ORATOR
	case CHIEFTAIN
	case PIONEER
	case BURGLAR
	case VICAR
	case OFFICER
	case EXPLORER
	case WARDEN
	case OUTLAW
	case ADEPT
	case BUM
	case SORCERER
	case LABORER
	case MASTER
	case ASCENDANT
	case VILLAGER
	case MAGUS
	case CONSCRIPT
	case WORKER
	case ACTOR
	case HERALD
	case HIGHWAYMAN
	case FORTUNE_HUNTER
	case GOVERNOR
	case SCRAPPER
	case MONK
	case HOMEMAKER
	case RECLUSE
	case STEWARD
	case POLYMATH
	case MAGICIAN
	case TRAVELER
	case VAGRANT
	case APPRENTICE
	case POLITICIAN
	case MEDIATOR
	case CROOK
	case CIVILIAN
	case ACTIVIST
	case HERO
	case CHAMPION
	case CLERIC
	case SLAVE
	case GUNMAN
	case CLAIRVOYANT
	case PATRIARCH
	case SHOPKEEPER
	case CRONE
	case ADVENTURER
	case SOLDIER
	case ENTERTAINER
	case CRAFTSMAN
	case SCIENTIST
	case ASCETIC
	case SUPERIOR
	case PERFORMER
	case MAGISTER
	case SERF
	case BRUTE
	case INQUISITOR
	case LORD
	case VILLAIN
	case PROFESSOR
	case SERVANT
	case CHARMER
	case GLOBETROTTER
	case SNIPER
	case COURTIER
	case PRIEST
	case TRADESMAN
	case HITMAN
	case WIZARD
	case BEGGAR
	case WARRIOR
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_NOUN {
		switch value {
			case 01: return .GYPSY
			case 02: return .WITCH
			case 03: return .MERCHANT
			case 04: return .EXPERT
			case 05: return .COMMONER
			case 06: return .JUDGE
			case 07: return .RANGER
			case 08: return .OCCULTIST
			case 09: return .REVEREND
			case 10: return .THUG
			case 11: return .DRIFTER
			case 12: return .JOURNEYMAN
			case 13: return .STATESMAN
			case 14: return .ASTROLOGER
			case 15: return .DUELIST
			case 16: return .JACK_OF_ALL_TRADES
			case 17: return .ARISTOCRAT
			case 18: return .PREACHER
			case 19: return .ARTISAN
			case 20: return .ROGUE
			case 21: return .MISSIONARY
			case 22: return .OUTCAST
			case 23: return .MERCENARY
			case 24: return .CARETAKER
			case 25: return .HERMIT
			case 26: return .ORATOR
			case 27: return .CHIEFTAIN
			case 28: return .PIONEER
			case 29: return .BURGLAR
			case 30: return .VICAR
			case 31: return .OFFICER
			case 32: return .EXPLORER
			case 33: return .WARDEN
			case 34: return .OUTLAW
			case 35: return .ADEPT
			case 36: return .BUM
			case 37: return .SORCERER
			case 38: return .LABORER
			case 39: return .MASTER
			case 40: return .ASCENDANT
			case 41: return .VILLAGER
			case 42: return .MAGUS
			case 43: return .CONSCRIPT
			case 44: return .WORKER
			case 45: return .ACTOR
			case 46: return .HERALD
			case 47: return .HIGHWAYMAN
			case 48: return .FORTUNE_HUNTER
			case 49: return .GOVERNOR
			case 50: return .SCRAPPER
			case 51: return .MONK
			case 52: return .HOMEMAKER
			case 53: return .RECLUSE
			case 54: return .STEWARD
			case 55: return .POLYMATH
			case 56: return .MAGICIAN
			case 57: return .TRAVELER
			case 58: return .VAGRANT
			case 59: return .APPRENTICE
			case 60: return .POLITICIAN
			case 61: return .MEDIATOR
			case 62: return .CROOK
			case 63: return .CIVILIAN
			case 64: return .ACTIVIST
			case 65: return .HERO
			case 66: return .CHAMPION
			case 67: return .CLERIC
			case 68: return .SLAVE
			case 69: return .GUNMAN
			case 70: return .CLAIRVOYANT
			case 71: return .PATRIARCH
			case 72: return .SHOPKEEPER
			case 73: return .CRONE
			case 74: return .ADVENTURER
			case 75: return .SOLDIER
			case 76: return .ENTERTAINER
			case 77: return .CRAFTSMAN
			case 78: return .SCIENTIST
			case 79: return .ASCETIC
			case 80: return .SUPERIOR
			case 81: return .PERFORMER
			case 82: return .MAGISTER
			case 83: return .SERF
			case 84: return .BRUTE
			case 85: return .INQUISITOR
			case 86: return .LORD
			case 87: return .VILLAIN
			case 88: return .PROFESSOR
			case 89: return .SERVANT
			case 90: return .CHARMER
			case 91: return .GLOBETROTTER
			case 92: return .SNIPER
			case 93: return .COURTIER
			case 94: return .PRIEST
			case 95, 99: return .TRADESMAN
			case 96: return .HITMAN
			case 97: return .WIZARD
			case 98: return .BEGGAR
			case 100: return .WARRIOR
			default: return .NONE
		}
	}

}


enum UNE_NPC_MOTIVATION_VERB: String, RPG_TABLE {
	typealias Result = UNE_NPC_MOTIVATION_VERB

	static var MIN: Int = 1
	static var MAX: Int = 100

	case ADVISE
	case OBTAIN
	case ATTEMPT
	case SPOIL
	case OPPRESS
	case INTERACT
	case CREATE
	case ABDUCT
	case PROMOTE
	case CONCEIVE
	case BLIGHT
	case PROGRESS
	case DISTRESS
	case POSSESS
	case RECORD
	case EMBRACE
	case CONTACT
	case PURSUE
	case ASSOCIATE
	case PREPARE
	case SHEPHERD
	case ABUSE
	case INDULGE
	case CHRONICLE
	case FULFILL
	case DRIVE
	case REVIEW
	case AID
	case FOLLOW
	case ADVANCE
	case GUARD
	case CONQUER
	case HINDER
	case PLUNDER
	case CONSTRUCT
	case ENCOURAGE
	case AGONIZE
	case COMPREHEND
	case ADMINISTER
	case RELATE
	case TAKE
	case DISCOVER
	case DETER
	case ACQUIRE
	case DAMAGE
	case PUBLICIZE
	case BURDEN
	case ADVOCATE
	case IMPLEMENT
	case UNDERSTAND
	case COLLABORATE
	case STRIVE
	case COMPLETE
	case COMPEL
	case JOIN
	case ASSIST
	case DEFILE
	case PRODUCE
	case INSTITUTE
	case ACCOUNT
	case WORK
	case ACCOMPANY
	case OFFEND
	case GUIDE
	case LEARN
	case PERSECUTE
	case COMMUNICATE
	case PROCESS
	case REPORT
	case DEVELOP
	case STEAL
	case SUGGEST
	case WEAKEN
	case ACHIEVE
	case SECURE
	case INFORM
	case PATRONIZE
	case DEPRESS
	case DETERMINE
	case SEEK
	case MANAGE
	case SUPPRESS
	case PROCLAIM
	case OPERATE
	case ACCESS
	case REFINE
	case COMPOSE
	case UNDERMINE
	case EXPLAIN
	case DISCOURAGE
	case ATTEND
	case DETECT
	case EXECUTE
	case MAINTAIN
	case REALIZE
	case CONVEY
	case ROB
	case ESTABLISH
	case OVERTHROW
	case SUPPORT
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_MOTIVATION_VERB {
		switch value {
			case 1: return .ADVISE
			case 2: return .OBTAIN
			case 3: return .ATTEMPT
			case 4: return .SPOIL
			case 5: return .OPPRESS
			case 6: return .INTERACT
			case 7: return .CREATE
			case 8: return .ABDUCT
			case 9: return .PROMOTE
			case 10: return .CONCEIVE
			case 11: return .BLIGHT
			case 12: return .PROGRESS
			case 13: return .DISTRESS
			case 14: return .POSSESS
			case 15: return .RECORD
			case 16: return .EMBRACE
			case 17: return .CONTACT
			case 18: return .PURSUE
			case 19: return .ASSOCIATE
			case 20: return .PREPARE
			case 21: return .SHEPHERD
			case 22: return .ABUSE
			case 23: return .INDULGE
			case 24: return .CHRONICLE
			case 25: return .FULFILL
			case 26: return .DRIVE
			case 27: return .REVIEW
			case 28: return .AID
			case 29: return .FOLLOW
			case 30: return .ADVANCE
			case 31: return .GUARD
			case 32: return .CONQUER
			case 33: return .HINDER
			case 34: return .PLUNDER
			case 35: return .CONSTRUCT
			case 36: return .ENCOURAGE
			case 37: return .AGONIZE
			case 38: return .COMPREHEND
			case 39: return .ADMINISTER
			case 40: return .RELATE
			case 41: return .TAKE
			case 42: return .DISCOVER
			case 43: return .DETER
			case 44: return .ACQUIRE
			case 45: return .DAMAGE
			case 46: return .PUBLICIZE
			case 47: return .BURDEN
			case 48: return .ADVOCATE
			case 49: return .IMPLEMENT
			case 50: return .UNDERSTAND
			case 51: return .COLLABORATE
			case 52: return .STRIVE
			case 53: return .COMPLETE
			case 54: return .COMPEL
			case 55: return .JOIN
			case 56: return .ASSIST
			case 57: return .DEFILE
			case 58: return .PRODUCE
			case 59: return .INSTITUTE
			case 60: return .ACCOUNT
			case 61: return .WORK
			case 62: return .ACCOMPANY
			case 63: return .OFFEND
			case 64: return .GUIDE
			case 65: return .LEARN
			case 66: return .PERSECUTE
			case 67: return .COMMUNICATE
			case 68: return .PROCESS
			case 69: return .REPORT
			case 70: return .DEVELOP
			case 71: return .STEAL
			case 72: return .SUGGEST
			case 73: return .WEAKEN
			case 74: return .ACHIEVE
			case 75: return .SECURE
			case 76: return .INFORM
			case 77: return .PATRONIZE
			case 78: return .DEPRESS
			case 79: return .DETERMINE
			case 80: return .SEEK
			case 81: return .MANAGE
			case 82: return .SUPPRESS
			case 83: return .PROCLAIM
			case 84: return .OPERATE
			case 85: return .ACCESS
			case 86: return .REFINE
			case 87: return .COMPOSE
			case 88: return .UNDERMINE
			case 89: return .EXPLAIN
			case 90: return .DISCOURAGE
			case 91: return .ATTEND
			case 92: return .DETECT
			case 93: return .EXECUTE
			case 94: return .MAINTAIN
			case 95: return .REALIZE
			case 96: return .CONVEY
			case 97: return .ROB
			case 98: return .ESTABLISH
			case 99: return .OVERTHROW
			default: return .NONE
		}
	}
}


enum UNE_NPC_MOTIVATION_NOUN: String, RPG_TABLE {
	typealias Result = UNE_NPC_MOTIVATION_NOUN

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WEALTH
	case HARDSHIP
	case AFFLUENCE
	case RESOURCES
	case PROSPERTITY
	case POVERTY
	case OPULENCE
	case DEPRIVATION
	case SUCCESS
	case DISTRESS
	case CONTRABAND
	case MUSIC
	case LITERATURE
	case TECHNOLOGY
	case ALCOHOL
	case MEDICINES
	case BEAUTY
	case STRENGTH
	case INTELLIGENCE
	case FORCE
	case THE_WEALTHY
	case THE_POPULOUS
	case ENEMIES
	case THE_PUBLIC
	case RELIGION
	case THE_POOR
	case FAMILY
	case THE_ELITE
	case ACADEMIA
	case THE_FORSAKEN
	case THE_LAW
	case THE_GOVERNMENT
	case THE_OPPRESSED
	case FRIENDS
	case CRIMINALS
	case ALLIES
	case SECRET_SOCIETIES
	case THE_WORLD
	case MILITARY
	case THE_CHURCH
	case DREAM
	case DISCRETION
	case LOVE
	case FREEDOM
	case PAIN
	case FAITH
	case SLAVERY
	case ENLIGHTENMENT
	case RACISM
	case SENSUALITY
	case DISSONANCE
	case PEACE
	case DISCRIMINATION
	case DISBELIEF
	case PLEASURE
	case HATE
	case HAPPINESS
	case SERVITUDE
	case HARMONY
	case JUSTICE
	case GLUTTONY
	case LUST
	case ENVY
	case GREED
	case LAZINESS
	case WRATH
	case PRIDE
	case PURITY
	case MODERATION
	case VIGILANCE
	case STEAL
	case SUGGEST
	case WEAKEN
	case ACHIEVE
	case SECURE
	case INFORM
	case PATRONIZE
	case DEPRESS
	case DETERMINE
	case SEEK
	case MANAGE
	case SUPPRESS
	case PROCLAIM
	case OPERATE
	case ACCESS
	case REFINE
	case COMPOSE
	case UNDERMINE
	case EXPLAIN
	case DISCOURGAE
	case ATTEND
	case DETECT
	case EXECUTE
	case MAINTAIN
	case REALIZE
	case CONVEY
	case ROB
	case ESTABLISH
	case OVERTHROW
	case SUPPORT
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_MOTIVATION_NOUN {

		switch value {
			case 1: return .WEALTH
			case 2: return .HARDSHIP
			case 3: return .AFFLUENCE
			case 4: return .RESOURCES
			case 5: return .PROSPERTITY
			case 6: return .POVERTY
			case 7: return .OPULENCE
			case 8: return .DEPRIVATION
			case 9: return .SUCCESS
			case 10: return .DISTRESS
			case 11: return .CONTRABAND
			case 12: return .MUSIC
			case 13: return .LITERATURE
			case 14: return .TECHNOLOGY
			case 15: return .ALCOHOL
			case 16: return .MEDICINES
			case 17: return .BEAUTY
			case 18: return .STRENGTH
			case 19: return .INTELLIGENCE
			case 20: return .FORCE
			case 21: return .THE_WEALTHY
			case 22: return .THE_POPULOUS
			case 23: return .ENEMIES
			case 24: return .THE_PUBLIC
			case 25: return .RELIGION
			case 26: return .THE_POOR
			case 27: return .FAMILY
			case 28: return .THE_ELITE
			case 29: return .ACADEMIA
			case 30: return .THE_FORSAKEN
			case 31: return .THE_LAW
			case 32: return .THE_GOVERNMENT
			case 33: return .THE_OPPRESSED
			case 34: return .FRIENDS
			case 35: return .CRIMINALS
			case 36: return .ALLIES
			case 37: return .SECRET_SOCIETIES
			case 38: return .THE_WORLD
			case 39: return .MILITARY
			case 40: return .THE_CHURCH
			case 41: return .DREAM
			case 42: return .DISCRETION
			case 43: return .LOVE
			case 44: return .FREEDOM
			case 45: return .PAIN
			case 46: return .FAITH
			case 47: return .SLAVERY
			case 48: return .ENLIGHTENMENT
			case 49: return .RACISM
			case 50: return .SENSUALITY
			case 51: return .DISSONANCE
			case 52: return .PEACE
			case 53: return .DISCRIMINATION
			case 54: return .DISBELIEF
			case 55: return .PLEASURE
			case 56: return .HATE
			case 57: return .HAPPINESS
			case 58: return .SERVITUDE
			case 59: return .HARMONY
			case 60: return .JUSTICE
			case 61: return .GLUTTONY
			case 62: return .LUST
			case 63: return .ENVY
			case 64: return .GREED
			case 65: return .LAZINESS
			case 66: return .WRATH
			case 67: return .PRIDE
			case 68: return .PURITY
			case 69: return .MODERATION
			case 70: return .VIGILANCE
			case 71: return .STEAL
			case 72: return .SUGGEST
			case 73: return .WEAKEN
			case 74: return .ACHIEVE
			case 75: return .SECURE
			case 76: return .INFORM
			case 77: return .PATRONIZE
			case 78: return .DEPRESS
			case 79: return .DETERMINE
			case 80: return .SEEK
			case 81: return .MANAGE
			case 82: return .SUPPRESS
			case 83: return .PROCLAIM
			case 84: return .OPERATE
			case 85: return .ACCESS
			case 86: return .REFINE
			case 87: return .COMPOSE
			case 88: return .UNDERMINE
			case 89: return .EXPLAIN
			case 90: return .DISCOURGAE
			case 91: return .ATTEND
			case 92: return .DETECT
			case 93: return .EXECUTE
			case 94: return .MAINTAIN
			case 95: return .REALIZE
			case 96: return .CONVEY
			case 97: return .ROB
			case 98: return .ESTABLISH
			case 99: return .OVERTHROW
			case 100: return .SUPPORT
			default: return .NONE
		}
	}

}



enum UNE_NPC_COVERSATION_MOOD_LOVED: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_LOVED

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_LOVED {
		switch value {
			case 1: return .WITHDRAWN
			case 2...6: return .GUARDED
			case 7...16: return .CAUTIOUS
			case 17...31: return .NEUTRAL
			case 32...70: return .SOCIALABLE
			case 71...85: return .HELPFUL
			case 86...100: return .FORTHCOMING
			default: return .NONE
		}
	}
}

enum UNE_NPC_COVERSATION_MOOD_FRIENDLY: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_FRIENDLY

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_FRIENDLY {
		switch value {
			case 1...2: return .WITHDRAWN
			case 3...8: return .GUARDED
			case 9...20: return .CAUTIOUS
			case 21...40: return .NEUTRAL
			case 41...76: return .SOCIALABLE
			case 77...89: return .HELPFUL
			case 90...100: return .FORTHCOMING
			default: return .NONE
		}
	}
}

enum UNE_NPC_COVERSATION_MOOD_PEACEFUL: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_PEACEFUL

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_PEACEFUL {
		switch value {
			case 1...3: return .WITHDRAWN
			case 4...11: return .GUARDED
			case 12...25: return .CAUTIOUS
			case 26...55: return .NEUTRAL
			case 56...82: return .SOCIALABLE
			case 83...93: return .HELPFUL
			case 94...100: return .FORTHCOMING
			default: return .NONE
		}
	}
}


enum UNE_NPC_COVERSATION_MOOD_NEUTRAL: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_NEUTRAL

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_NEUTRAL {
		switch value {
			case 1...5: return .WITHDRAWN
			case 6...15: return .GUARDED
			case 16...30: return .CAUTIOUS
			case 31...60: return .NEUTRAL
			case 61...85: return .SOCIALABLE
			case 86...95: return .HELPFUL
			case 96...100: return .FORTHCOMING
			default: return .NONE
		}
	}
}


enum UNE_NPC_COVERSATION_MOOD_DISTRUSTFUL: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_DISTRUSTFUL

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_DISTRUSTFUL {
		switch value {
			case 1...7: return .WITHDRAWN
			case 8...18: return .GUARDED
			case 19...46: return .CAUTIOUS
			case 47...76: return .NEUTRAL
			case 77...90: return .SOCIALABLE
			case 91...97: return .HELPFUL
			case 98...100: return .FORTHCOMING
			default: return .NONE
		}
	}
}

enum UNE_NPC_COVERSATION_MOOD_HOSTILE: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_HOSTILE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_HOSTILE {
		switch value {
			case 1...11: return .WITHDRAWN
			case 12...24: return .GUARDED
			case 25...61: return .CAUTIOUS
			case 62...81: return .NEUTRAL
			case 82...93: return .SOCIALABLE
			case 94...98: return .HELPFUL
			case 99...100: return .FORTHCOMING
			default: return .NONE
		}
	}
}


enum UNE_NPC_COVERSATION_MOOD_HATED: String, RPG_TABLE {
	typealias Result = UNE_NPC_COVERSATION_MOOD_HATED

	static var MIN: Int = 1
	static var MAX: Int = 100

	case WITHDRAWN
	case GUARDED
	case CAUTIOUS
	case NEUTRAL
	case SOCIALABLE
	case HELPFUL
	case FORTHCOMING
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_COVERSATION_MOOD_HATED {
		switch value {
			case 1...15: return .WITHDRAWN
			case 16...30: return .GUARDED
			case 31...69: return .CAUTIOUS
			case 70...84: return .NEUTRAL
			case 85...94: return .SOCIALABLE
			case 95...99: return .HELPFUL
			case 100: return .FORTHCOMING
			default: return .NONE
		}
	}
}


enum UNE_NPC_BEARING: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING

	static var MIN: Int = 1
	static var MAX: Int = 100

	case SCHEMING
	case INSANE
	case FRIENDLY
	case HOSTILE
	case INQUISITIVE
	case KNOWNING
	case MYSTERIOUS
	case PREJUDICED
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING {
		switch value {
			case 1...12: return .SCHEMING
			case 13...24: return .INSANE
			case 25...36: return .FRIENDLY
			case 37...49: return .HOSTILE
			case 50...62: return .INQUISITIVE
			case 63...75: return .KNOWNING
			case 76...88: return .MYSTERIOUS
			case 89...100: return .PREJUDICED
			default: return .NONE
		}
	}
}


enum UNE_NPC_BEARING_SCHEMING: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_SCHEMING

	static var MIN: Int = 1
	static var MAX: Int = 100

	case INTENT
	case BARGIN
	case MEANS
	case PROPOSITION
	case PLAN
	case COMPROMISE
	case AGENDA
	case ARRANGEMENT
	case NEGOTIATION
	case PLOT
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_SCHEMING {
		switch value {
			case 1...10: return .INTENT
			case 11...20: return .BARGIN
			case 21...30: return .MEANS
			case 31...40: return .PROPOSITION
			case 41...50: return .PLAN
			case 51...60: return .COMPROMISE
			case 61...70: return .AGENDA
			case 71...80: return .ARRANGEMENT
			case 81...90: return .NEGOTIATION
			case 91...100: return .PLOT
			default: return .NONE
		}
	}
}

enum UNE_NPC_BEARING_INSANE: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_INSANE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case MADNESS
	case FEAR
	case ACCIDENT
	case CHAOS
	case IDOCY
	case ILLUSION
	case TURMOIL
	case CONFUSION
	case FACADE
	case BEWILDERMENT
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_INSANE {
		switch value {
			case 1...10: return .MADNESS
			case 11...20: return .FEAR
			case 21...30: return .ACCIDENT
			case 31...40: return .CHAOS
			case 41...50: return .IDOCY
			case 51...60: return .ILLUSION
			case 61...70: return .TURMOIL
			case 71...80: return .CONFUSION
			case 81...90: return .FACADE
			case 91...100: return .BEWILDERMENT
			default: return .NONE
		}
	}
}


enum UNE_NPC_BEARING_FRIENDLY: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_FRIENDLY

	static var MIN: Int = 1
	static var MAX: Int = 100

	case ALLIANCE
	case COMFORT
	case GRATITUDE
	case SHELTER
	case HAPPINESS
	case SUPPORT
	case PROMISE
	case DELIGHT
	case AID
	case CELEBRATION
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_FRIENDLY {
		switch value {
			case 1...10: return .ALLIANCE
			case 11...20: return .COMFORT
			case 21...30: return .GRATITUDE
			case 31...40: return .SHELTER
			case 41...50: return .HAPPINESS
			case 51...60: return .SUPPORT
			case 61...70: return .PROMISE
			case 71...80: return .DELIGHT
			case 81...90: return .AID
			case 91...100: return .CELEBRATION
			default: return .NONE
		}
	}
}


enum UNE_NPC_BEARING_HOSTILE: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_HOSTILE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case DEATH
	case CAPTURE
	case JUDGEMENT
	case COMBAT
	case SURRENDER
	case RAGE
	case RESENTMENT
	case SUBMISSION
	case INJURY
	case DESTRUCTION
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_HOSTILE {
		switch value {
			case 1...10: return .DEATH
			case 11...20: return .CAPTURE
			case 21...30: return .JUDGEMENT
			case 31...40: return .COMBAT
			case 41...50: return .SURRENDER
			case 51...60: return .RAGE
			case 61...70: return .RESENTMENT
			case 71...80: return .SUBMISSION
			case 81...90: return .INJURY
			case 91...100: return .DESTRUCTION
			default: return .NONE
		}
	}
}


enum UNE_NPC_BEARING_INQUISITIVE: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_INQUISITIVE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case QUESTIONS
	case INVERSTIGATION
	case INTEREST
	case DEMAND
	case SUSPICION
	case REQUEST
	case CURIOUSITY
	case SKEPTICISM
	case COMMAND
	case PETITION
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_INQUISITIVE {
		switch value {
			case 1...10: return .QUESTIONS
			case 11...20: return .INVERSTIGATION
			case 21...30: return .INTEREST
			case 31...40: return .DEMAND
			case 41...50: return .SUSPICION
			case 51...60: return .REQUEST
			case 61...70: return .CURIOUSITY
			case 71...80: return .SKEPTICISM
			case 81...90: return .COMMAND
			case 91...100: return .PETITION
			default: return .NONE
		}
	}
}

enum UNE_NPC_BEARING_KNOWING: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_KNOWING

	static var MIN: Int = 1
	static var MAX: Int = 100

	case REPORT
	case EFFECTS
	case EXAMINATION
	case RECORDS
	case ACCOUNT
	case NEWS
	case HISTORY
	case TELLING
	case DISCOURSE
	case SPEECH
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_KNOWING {
		switch value {
			case 1...10: return .REPORT
			case 11...20: return .EFFECTS
			case 21...30: return .EXAMINATION
			case 31...40: return .RECORDS
			case 41...50: return .ACCOUNT
			case 51...60: return .NEWS
			case 61...70: return .HISTORY
			case 71...80: return .TELLING
			case 81...90: return .DISCOURSE
			case 91...100: return .SPEECH
			default: return .NONE
		}
	}
}

enum UNE_NPC_BEARING_MYSTERIOUS: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_MYSTERIOUS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case RUMOR
	case UNCERTAINITY
	case SECRETS
	case MISDIRECTION
	case WHISPERS
	case LIES
	case SHADOWS
	case ENIGMA
	case OBSCURITY
	case CONUNDRUM
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_MYSTERIOUS {
		switch value {
			case 1...10: return .RUMOR
			case 11...20: return .UNCERTAINITY
			case 21...30: return .SECRETS
			case 31...40: return .MISDIRECTION
			case 41...50: return .WHISPERS
			case 51...60: return .LIES
			case 61...70: return .SHADOWS
			case 71...80: return .ENIGMA
			case 81...90: return .OBSCURITY
			case 91...100: return .CONUNDRUM
			default: return .NONE
		}
	}
}

enum UNE_NPC_BEARING_PREJUDICED: String, RPG_TABLE {
	typealias Result = UNE_NPC_BEARING_PREJUDICED

	static var MIN: Int = 1
	static var MAX: Int = 100

	case REPUTATION
	case DOUBT
	case BIAS
	case DISLIKE
	case PARTIALITY
	case BELIEF
	case VIEW
	case DISCRIMINATION
	case ASSESSMENT
	case DIFFERENCE
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_BEARING_PREJUDICED {
		switch value {
			case 1...10: return .REPUTATION
			case 11...20: return .DOUBT
			case 21...30: return .BIAS
			case 31...40: return .DISLIKE
			case 41...50: return .PARTIALITY
			case 51...60: return .BELIEF
			case 61...70: return .VIEW
			case 71...80: return .DISCRIMINATION
			case 81...90: return .ASSESSMENT
			case 91...100: return .DIFFERENCE
			default: return .NONE
		}
	}
}



enum UNE_NPC_FOCUS: String, RPG_TABLE {
	typealias Result = UNE_NPC_FOCUS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CURRENT_SCENE
	case LAST_STORY
	case EQUIPMENT
	case PARENTS
	case HISTORY
	case RETAINERS
	case WEALTH
	case RELICS
	case LAST_ACTION
	case SKILLS
	case SUPERIORS
	case FAME
	case CAMPAIGN
	case FUTURE_ACTION
	case FRIENDS
	case ALLIES
	case LAST_SCENE
	case CONTACTS
	case FLAWS
	case ANTAGONIST
	case REWARDS
	case EXPERIENCE
	case KNOWLEDGE
	case RECENT_SCENE
	case COMMUNITY
	case TREASURE
	case THE_CHARACTER
	case CURRENT_STORY
	case FAMILY
	case POWER
	case WEAPONS
	case PREVIOUS_SCENE
	case ENEMY
	case NONE

	static func getElementBy(value: Int) -> UNE_NPC_FOCUS {
		switch value {
			case 1...3: return .CURRENT_SCENE
			case 4...6: return .LAST_STORY
			case 7...9: return .EQUIPMENT
			case 10...12: return .PARENTS
			case 13...15: return .HISTORY
			case 16...18: return .RETAINERS
			case 19...21: return .WEALTH
			case 22...24: return .RELICS
			case 25...27: return .LAST_ACTION
			case 28...30: return .SKILLS
			case 31...33: return .SUPERIORS
			case 34...36: return .FAME
			case 37...39: return .CAMPAIGN
			case 40...42: return .FUTURE_ACTION
			case 43...45: return .FRIENDS
			case 46...48: return .ALLIES
			case 49...51: return .LAST_SCENE
			case 52...54: return .CONTACTS
			case 55...57: return .FLAWS
			case 58...60: return .ANTAGONIST
			case 61...63: return .REWARDS
			case 64...66: return .EXPERIENCE
			case 67...69: return .KNOWLEDGE
			case 70...72: return .RECENT_SCENE
			case 73...75: return .COMMUNITY
			case 76...78: return .TREASURE
			case 79...81: return .THE_CHARACTER
			case 82...84: return .CURRENT_STORY
			case 85...87: return .FAMILY
			case 88...90: return .POWER
			case 91...93: return .WEAPONS
			case 94...96: return .PREVIOUS_SCENE
			case 97...100: return .ENEMY
			default: return .NONE
		}
	}
}

