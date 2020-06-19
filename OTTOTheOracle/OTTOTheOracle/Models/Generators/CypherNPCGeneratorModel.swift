//
//  CypherNPCGeneratorModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/14/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class CypherNPCGeneratorModel {

	func getRandomCharacter() -> CypherNPCCharacter {

		return CypherNPCCharacter(
			name: "",
			description: CYPHER_CHARACTER_DESCRIPTOR.randomWeightedElement(),
			type: CYPHER_CHARACTER_TYPE.randomWeightedElement(),
			characterFocusA: CYPHER_CHARACTER_FOCUS_A.randomWeightedElement(),
			characterFocusB: CYPHER_CHARACTER_FOCUS_B.randomWeightedElement(),
			characterMotivation: CYPHER_CHARACTER_MOTIVATION.randomWeightedElement(),
			interactionTone: CYPHER_CHARACTER_INTERACTION_EMOTIONAL_TONE.randomWeightedElement(),
			interactionDescriptorA: CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_A.randomWeightedElement(),
			interactionDescriptorB: CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_B.randomWeightedElement(),
			interactionFocus: CYPHER_CHARACTER_INTERACTION_FOCUS.randomWeightedElement())

	}

}


struct CypherNPCCharacter {
	var name: String
	var description: CYPHER_CHARACTER_DESCRIPTOR
	var type:  CYPHER_CHARACTER_TYPE
	var characterFocusA: CYPHER_CHARACTER_FOCUS_A
	var characterFocusB: CYPHER_CHARACTER_FOCUS_B
	var characterMotivation: CYPHER_CHARACTER_MOTIVATION
	var interactionTone: CYPHER_CHARACTER_INTERACTION_EMOTIONAL_TONE
	var interactionDescriptorA: CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_A
	var interactionDescriptorB: CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_B
	var interactionFocus: CYPHER_CHARACTER_INTERACTION_FOCUS
}


enum CYPHER_CHARACTER_DESCRIPTOR: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_DESCRIPTOR

	static var MIN: Int = 1
	static var MAX: Int = 100

	case OUTSPOKEN
	case ADDICTED
	case CONFORMIST
	case RATIONAL
	case REBELLIOUS
	case RENOWNED
	case PHILOSOPHICAL
	case SPIRITUAL
	case SUPERFLUOUS
	case RELIGIOUS
	case LOVEABLE
	case PASSIONATE
	case YOUTHFUL
	case ELDERLY
	case MISERLY
	case AFFLUENT
	case GREEDY
	case HELPFUL
	case KINDLY
	case GENEROUS
	case FLAMBOYANT
	case WICKED
	case THOUGHTFUL
	case PESSIMISTIC
	case PRACTICAL
	case JOLLY
	case CHEERFUL
	case MISERABLE
	case LIBERAL
	case CHARMING
	case MEAN
	case INQUISITIVE
	case PIOUS
	case FORTHRIGHT
	case FLIPPANT
	case DEPENDABLE
	case CONFIDENT
	case SENSIBLE
	case WILD
	case UNPREDICTABLE
	case NOTORIOUS
	case FAMOUS
	case INFAMOUS
	case SEDUCTIVE
	case PARANOID
	case LOGICAL
	case MYSTICAL
	case DILIGENT
	case CAREFREE
	case EVIL
	case ETHICAL
	case FRIENDLY
	case CONNIVING
	case CONNING
	case DECEITFUL
	case OPTIMISTIC
	case CORRUPT
	case LOYAL
	case PETTY
	case ZEALOUS
	case OVERBEARING
	case TIMID
	case STUBBORN
	case UNRULY
	case ROMANTIC
	case DISDAINFUL
	case AMIABLE
	case COMEDIC
	case LAZY
	case INDIFFERENT
	case SCHOLARLY
	case IDIOTIC
	case CONSERVATIVE
	case SKILLED
	case ADVENTUROUS
	case BOHEMIAN
	case POSSESSIVE
	case JEALOUS
	case CRAZY
	case NEFARIOUS
	case OSTENTATIOUS
	case GREGARIOUS
	case GRATUITOUS
	case GLUTTONOUS
	case ALCOHOLIC
	case MEDDLING
	case OVERRULING
	case DOMINANT
	case SUBMISSIVE
	case SERIOUS
	case HILARIOUS
	case INTENSE
	case WHIMSICAL
	case DEADLY
	case DULL
	case SMOOTH
	case COOL
	case DANGEROUS
	case CULTURED
	case IDEALISTIC
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}


	static func getElementBy(value: Int) -> CYPHER_CHARACTER_DESCRIPTOR {
		switch value {

			case 1: return .OUTSPOKEN
			case 2: return .ADDICTED
			case 3: return .CONFORMIST
			case 4: return .RATIONAL
			case 5: return .REBELLIOUS
			case 6: return .RENOWNED
			case 7: return .PHILOSOPHICAL
			case 8: return .SPIRITUAL
			case 9: return .SUPERFLUOUS
			case 10: return .RELIGIOUS
			case 11: return .LOVEABLE
			case 12: return .PASSIONATE
			case 13: return .YOUTHFUL
			case 14: return .ELDERLY
			case 15: return .MISERLY
			case 16: return .AFFLUENT
			case 17: return .GREEDY
			case 18: return .HELPFUL
			case 19: return .KINDLY
			case 20: return .GENEROUS
			case 21: return .FLAMBOYANT
			case 22: return .WICKED
			case 23: return .THOUGHTFUL
			case 24: return .PESSIMISTIC
			case 25: return .PRACTICAL
			case 26: return .JOLLY
			case 27: return .CHEERFUL
			case 28: return .MISERABLE
			case 29: return .LIBERAL
			case 30: return .CHARMING
			case 31: return .MEAN
			case 32: return .INQUISITIVE
			case 33: return .PIOUS
			case 34: return .FORTHRIGHT
			case 35: return .FLIPPANT
			case 36: return .DEPENDABLE
			case 37: return .CONFIDENT
			case 38: return .SENSIBLE
			case 39: return .WILD
			case 40: return .UNPREDICTABLE
			case 41: return .NOTORIOUS
			case 42: return .FAMOUS
			case 43: return .INFAMOUS
			case 44: return .SEDUCTIVE
			case 45: return .PARANOID
			case 46: return .LOGICAL
			case 47: return .MYSTICAL
			case 48: return .DILIGENT
			case 49: return .CAREFREE
			case 50: return .EVIL
			case 51: return .ETHICAL
			case 52: return .FRIENDLY
			case 53: return .CONNIVING
			case 54: return .CONNING
			case 55: return .DECEITFUL
			case 56: return .OPTIMISTIC
			case 57: return .CORRUPT
			case 58: return .LOYAL
			case 59: return .PETTY
			case 60: return .ZEALOUS
			case 61: return .OVERBEARING
			case 62: return .TIMID
			case 63: return .STUBBORN
			case 64: return .UNRULY
			case 65: return .ROMANTIC
			case 66: return .DISDAINFUL
			case 67: return .AMIABLE
			case 68: return .COMEDIC
			case 69: return .LAZY
			case 70: return .INDIFFERENT
			case 71: return .SCHOLARLY
			case 72: return .IDIOTIC
			case 73: return .CONSERVATIVE
			case 74: return .SKILLED
			case 75: return .ADVENTUROUS
			case 76: return .BOHEMIAN
			case 77: return .POSSESSIVE
			case 78: return .JEALOUS
			case 79: return .CRAZY
			case 80: return .NEFARIOUS
			case 81: return .OSTENTATIOUS
			case 82: return .GREGARIOUS
			case 83: return .GRATUITOUS
			case 84: return .GLUTTONOUS
			case 85: return .ALCOHOLIC
			case 86: return .MEDDLING
			case 87: return .OVERRULING
			case 88: return .DOMINANT
			case 89: return .SUBMISSIVE
			case 90: return .SERIOUS
			case 91: return .HILARIOUS
			case 92: return .INTENSE
			case 93: return .WHIMSICAL
			case 94: return .DEADLY
			case 95: return .DULL
			case 96: return .SMOOTH
			case 97: return .COOL
			case 98: return .DANGEROUS
			case 99: return .CULTURED
			case 100: return .IDEALISTIC
			default: return .NONE
		}
	}
}


enum CYPHER_CHARACTER_TYPE: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_TYPE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case GYPSY
	case WITCH
	case MERCHANT
	case ADEPT
	case PAUPER
	case SCHOLAR
	case BUSINESS_PERSON
	case TRADER
	case FIGHTER
	case PRIEST
	case NOBLE_BORN
	case TRAMP
	case GAMBLER
	case STUDENT
	case SCIENTIST
	case ASTROLOGER
	case CHEF
	case FIXER
	case INFORMANT
	case SOLDIER
	case LAW_ENFORCER
	case JUDGE
	case THIEF
	case SMUGGLER
	case INNKEEPER
	case INVENTOR
	case ARTIST
	case SORCERER
	case WIZARD
	case MAGE
	case PSYCHIC
	case SHAMAN
	case HISTORIAN
	case ARCHAEOLOGIST
	case LIBRARIAN
	case DOCTOR
	case DRUID
	case HERO
	case TELEPATH
	case FARMER
	case LANDOWNER
	case MAID
	case ASSASSIN
	case VET
	case BARTENDER
	case ENGINEER
	case CRAFTSMAN
	case SHAPE
	case SPECTRE
	case GOVERNMENT
	case CAPTAIN
	case PILOT
	case SERVANT
	case SERGEANT
	case AUTOMATON
	case PEACE_KEEPER
	case MURDERER
	case EXPLORER
	case MESSENGER
	case PERFORMER
	case NOMAD
	case HERMIT
	case ROYALTY
	case COMEDIAN
	case FISHERMAN
	case CRIME_LORD
	case CELEBRITY
	case AGENT
	case ADVENTURER
	case CLERIC
	case MUSICIAN
	case BODYGUARD
	case BOUNTY_HUNTER
	case BUREAUCRAT
	case BROTHEL_OWNER
	case REBEL
	case ENCHANTER
	case NECROMANCER
	case PROSTITUTE
	case PREACHER
	case HACKER
	case PIRATE
	case SAGE
	case ATHLETE
	case OUTCAST
	case REFUGEE
	case MERCENARY
	case OUTLAW
	case TRADESMAN
	case GURU
	case MONEY_LENDER
	case SHOP_OWNER
	case ZEALOT
	case WEAPONS_EXPERT
	case MARTIAL_ARTIST
	case GENIUS
	case TINKER
	case MUTANT
	case EXTRA_TERRESTRIAL
	case HENCHMAN
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_TYPE {
		switch value {
			case 1: return .GYPSY
			case 2: return .WITCH
			case 3: return .MERCHANT
			case 4: return .ADEPT
			case 5: return .PAUPER
			case 6: return .SCHOLAR
			case 7: return .BUSINESS_PERSON
			case 8: return .TRADER
			case 9: return .FIGHTER
			case 10: return .PRIEST
			case 11: return .NOBLE_BORN
			case 12: return .TRAMP
			case 13: return .GAMBLER
			case 14: return .STUDENT
			case 15: return .SCIENTIST
			case 16: return .ASTROLOGER
			case 17: return .CHEF
			case 18: return .FIXER
			case 19: return .INFORMANT
			case 20: return .SOLDIER
			case 21: return .LAW_ENFORCER
			case 22: return .JUDGE
			case 23: return .THIEF
			case 24: return .SMUGGLER
			case 25: return .INNKEEPER
			case 26: return .INVENTOR
			case 27: return .ARTIST
			case 28: return .SORCERER
			case 29: return .WIZARD
			case 30: return .MAGE
			case 31: return .PSYCHIC
			case 32: return .SHAMAN
			case 33: return .HISTORIAN
			case 34: return .ARCHAEOLOGIST
			case 35: return .LIBRARIAN
			case 36: return .DOCTOR
			case 37: return .DRUID
			case 38: return .HERO
			case 39: return .TELEPATH
			case 40: return .FARMER
			case 41: return .LANDOWNER
			case 42: return .MAID
			case 43: return .ASSASSIN
			case 44: return .VET
			case 45: return .BARTENDER
			case 46: return .ENGINEER
			case 47: return .CRAFTSMAN
			case 48: return .SHAPE
			case 49: return .SPECTRE
			case 50: return .GOVERNMENT
			case 51: return .CAPTAIN
			case 52: return .PILOT
			case 53: return .SERVANT
			case 54: return .SERGEANT
			case 55: return .AUTOMATON
			case 56: return .PEACE_KEEPER
			case 57: return .MURDERER
			case 58: return .EXPLORER
			case 59: return .MESSENGER
			case 60: return .PERFORMER
			case 61: return .NOMAD
			case 62: return .HERMIT
			case 63: return .ROYALTY
			case 64: return .COMEDIAN
			case 65: return .FISHERMAN
			case 66: return .CRIME_LORD
			case 67: return .CELEBRITY
			case 68: return .AGENT
			case 69: return .ADVENTURER
			case 70: return .CLERIC
			case 71: return .MUSICIAN
			case 72: return .BODYGUARD
			case 73: return .BOUNTY_HUNTER
			case 74: return .BUREAUCRAT
			case 75: return .BROTHEL_OWNER
			case 76: return .REBEL
			case 77: return .ENCHANTER
			case 78: return .NECROMANCER
			case 79: return .PROSTITUTE
			case 80: return .PREACHER
			case 81: return .HACKER
			case 82: return .PIRATE
			case 83: return .SAGE
			case 84: return .ATHLETE
			case 85: return .OUTCAST
			case 86: return .REFUGEE
			case 87: return .MERCENARY
			case 88: return .OUTLAW
			case 89: return .TRADESMAN
			case 90: return .GURU
			case 91: return .MONEY_LENDER
			case 92: return .SHOP_OWNER
			case 93: return .ZEALOT
			case 94: return .WEAPONS_EXPERT
			case 95: return .MARTIAL_ARTIST
			case 96: return .GENIUS
			case 97: return .TINKER
			case 98: return .MUTANT
			case 99: return .EXTRA_TERRESTRIAL
			case 100: return .HENCHMAN
			default: return .NONE
		}
	}
}



enum CYPHER_CHARACTER_FOCUS_A: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_FOCUS_A

	static var MIN: Int = 1
	static var MAX: Int = 100

	case CONQUER
	case PLUNDER
	case STEAL
	case CREATE
	case PURSUE
	case EXPLAIN
	case REALISE
	case SEEK
	case PRODUCE
	case GUARD
	case ATTEMPT
	case POSSESS
	case HELP
	case CONTROL
	case SUPPORT
	case ADVISE
	case OBTAIN
	case EXPERIEMENT
	case INFORM
	case BALANCE
	case ENJOY
	case SMASH
	case WATCH
	case TRAVEL
	case WASTE
	case TRANSPORT
	case ENTERTAIN
	case PUNISH
	case INVITE
	case FIX
	case BREAK
	case ANALYSE
	case HANDLE
	case FLY
	case TERRIFY
	case CALCULATE
	case TRADE
	case PEDAL
	case PRETEND
	case MEMORIZE
	case PROVIDE
	case WRECK
	case HOPE
	case STRENGTHEN
	case GUIDE
	case LICENCE
	case PRESERVE
	case SHIFTER
	case QUESTION
	case OFFICIAL
	case SCATTER
	case COMPARE
	case DESTROY
	case BURN
	case BOAST
	case ORGANISE
	case MAKE
	case OBSERVE
	case HOVER
	case WELCOME
	case UNCOVER
	case COMPLETE
	case CHEAT
	case HUNT
	case LEARN
	case ACCEPT
	case TAME
	case LIVE
	case ENCOURAGE
	case DELIGHT
	case EXPAND
	case COLLECT
	case DECEIVE
	case ADMIRE
	case DELIVER
	case FULFIL
	case NOTICE
	case INJECT
	case WANDER
	case DIVIDE
	case UNITE
	case SETTLE
	case TEMPT
	case SAVE
	case ORDER
	case REJECT
	case DRESS
	case DISCOVER
	case SURROUND
	case CONTINUE
	case PICK
	case TRACE
	case SPY
	case LISTEN
	case EXAMINE
	case CONJURE
	case ADMINISTER
	case WARP
	case BEND
	case TWIST
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_FOCUS_A {
		switch value {
			case 1: return .CONQUER
			case 2: return .PLUNDER
			case 3: return .STEAL
			case 4: return .CREATE
			case 5: return .PURSUE
			case 6: return .EXPLAIN
			case 7: return .REALISE
			case 8: return .SEEK
			case 9: return .PRODUCE
			case 10: return .GUARD
			case 11: return .ATTEMPT
			case 12: return .POSSESS
			case 13: return .HELP
			case 14: return .CONTROL
			case 15: return .SUPPORT
			case 16: return .ADVISE
			case 17: return .OBTAIN
			case 18: return .EXPERIEMENT
			case 19: return .INFORM
			case 20: return .BALANCE
			case 21: return .ENJOY
			case 22: return .SMASH
			case 23: return .WATCH
			case 24: return .TRAVEL
			case 25: return .WASTE
			case 26: return .TRANSPORT
			case 27: return .ENTERTAIN
			case 28: return .PUNISH
			case 29: return .INVITE
			case 30: return .FIX
			case 31: return .BREAK
			case 32: return .ANALYSE
			case 33: return .HANDLE
			case 34: return .FLY
			case 35: return .TERRIFY
			case 36: return .CALCULATE
			case 37: return .TRADE
			case 38: return .PEDAL
			case 39: return .PRETEND
			case 40: return .MEMORIZE
			case 41: return .PROVIDE
			case 42: return .WRECK
			case 43: return .HOPE
			case 44: return .STRENGTHEN
			case 45: return .GUIDE
			case 46: return .LICENCE
			case 47: return .PRESERVE
			case 48: return .SHIFTER
			case 49: return .QUESTION
			case 50: return .OFFICIAL
			case 51: return .SCATTER
			case 52: return .COMPARE
			case 53: return .DESTROY
			case 54: return .BURN
			case 55: return .BOAST
			case 56: return .ORGANISE
			case 57: return .MAKE
			case 58: return .OBSERVE
			case 59: return .HOVER
			case 60: return .WELCOME
			case 61: return .UNCOVER
			case 62: return .COMPLETE
			case 63: return .CHEAT
			case 64: return .HUNT
			case 65: return .LEARN
			case 66: return .ACCEPT
			case 67: return .TAME
			case 68: return .LIVE
			case 69: return .ENCOURAGE
			case 70: return .DELIGHT
			case 71: return .EXPAND
			case 72: return .COLLECT
			case 73: return .DECEIVE
			case 74: return .ADMIRE
			case 75: return .DELIVER
			case 76: return .FULFIL
			case 77: return .NOTICE
			case 78: return .INJECT
			case 79: return .WANDER
			case 80: return .DIVIDE
			case 81: return .UNITE
			case 82: return .SETTLE
			case 83: return .TEMPT
			case 84: return .SAVE
			case 85: return .ORDER
			case 86: return .REJECT
			case 87: return .DRESS
			case 88: return .DISCOVER
			case 89: return .SURROUND
			case 90: return .CONTINUE
			case 91: return .PICK
			case 92: return .TRACE
			case 93: return .SPY
			case 94: return .LISTEN
			case 95: return .EXAMINE
			case 96: return .CONJURE
			case 97: return .ADMINISTER
			case 98: return .WARP
			case 99: return .BEND
			case 100: return .TWIST
			default: return .NONE
		}
	}
}


enum CYPHER_CHARACTER_FOCUS_B: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_FOCUS_B

	static var MIN: Int = 1
	static var MAX: Int = 100

	case FREEDOM
	case HARDSHIP
	case SUCCESS
	case FAILURE
	case REDEMPTION
	case MAGIC
	case KNOWLEDGE
	case PLEASURE
	case DRUGS
	case LUST
	case PRIDE
	case HAPPINESS
	case LOVE
	case PROSPERITY
	case MODESTY
	case FAME
	case NOTORIETY
	case STRENGTH
	case WEAKNESS
	case HUMILITY
	case GREED
	case REVENGE
	case FAMILY
	case FRIENDSHIP
	case FAITH
	case WEALTH
	case LOYALTY
	case LAZINESS
	case DILIGENCE
	case OPTIMISM
	case LAW
	case TECHNOLOGY
	case COMMUNICATIONS
	case WEAPONS
	case CARGO
	case RESOURCES
	case TRUTH
	case LIES
	case RELIGION
	case ART
	case CHILDREN
	case EXISTENCE
	case AMUSEMENT
	case SOCIETY
	case CREATION
	case UNIVERSE
	case CULT
	case PROGRAM
	case INDUSTRY
	case BATTLE
	case CREATURES
	case LIFE
	case CONTRABAND
	case JUSTICE
	case INJUSTICE
	case DEBT
	case PATIENCE
	case HARMONY
	case AUTHORITY
	case ALLIES
	case REGRET
	case MYTHS
	case DOUBT
	case COMPETITION
	case CHANGE
	case LIBERATION
	case SUBMISSION
	case HEALTH
	case CONFIDENCE
	case ACCEPTANCE
	case COMPANY
	case ELITE
	case MEEK
	case WORTHY
	case EQUIPMENT
	case REPRESENTATIVE
	case ACADEMIA
	case BEAUTY
	case DELIGHT
	case PAIN
	case ASSISTANCE
	case NEWS
	case VISIONS
	case DISCOVERY
	case GOVERNMENT
	case DIRECTION
	case GROWTH
	case VOYAGE
	case LANGUAGE
	case MUSIC
	case DISTRIBUTION
	case CONTRACT
	case SENSUALITY
	case ANGER
	case WRATH
	case THEORIES
	case CONSPIRACY
	case CHARITY
	case MEDICINE
	case WELLBEING
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_FOCUS_B {
		switch value {
			case 1: return .FREEDOM
			case 2: return .HARDSHIP
			case 3: return .SUCCESS
			case 4: return .FAILURE
			case 5: return .REDEMPTION
			case 6: return .MAGIC
			case 7: return .KNOWLEDGE
			case 8: return .PLEASURE
			case 9: return .DRUGS
			case 10: return .LUST
			case 11: return .PRIDE
			case 12: return .HAPPINESS
			case 13: return .LOVE
			case 14: return .PROSPERITY
			case 15: return .MODESTY
			case 16: return .FAME
			case 17: return .NOTORIETY
			case 18: return .STRENGTH
			case 19: return .WEAKNESS
			case 20: return .HUMILITY
			case 21: return .GREED
			case 22: return .REVENGE
			case 23: return .FAMILY
			case 24: return .FRIENDSHIP
			case 25: return .FAITH
			case 26: return .WEALTH
			case 27: return .LOYALTY
			case 28: return .LAZINESS
			case 29: return .DILIGENCE
			case 30: return .OPTIMISM
			case 31: return .LAW
			case 32: return .TECHNOLOGY
			case 33: return .COMMUNICATIONS
			case 34: return .WEAPONS
			case 35: return .CARGO
			case 36: return .RESOURCES
			case 37: return .TRUTH
			case 38: return .LIES
			case 39: return .RELIGION
			case 40: return .ART
			case 41: return .CHILDREN
			case 42: return .EXISTENCE
			case 43: return .AMUSEMENT
			case 44: return .SOCIETY
			case 45: return .CREATION
			case 46: return .UNIVERSE
			case 47: return .CULT
			case 48: return .PROGRAM
			case 49: return .INDUSTRY
			case 50: return .BATTLE
			case 51: return .CREATURES
			case 52: return .LIFE
			case 53: return .CONTRABAND
			case 54: return .JUSTICE
			case 55: return .INJUSTICE
			case 56: return .DEBT
			case 57: return .PATIENCE
			case 58: return .HARMONY
			case 59: return .AUTHORITY
			case 60: return .ALLIES
			case 61: return .REGRET
			case 62: return .MYTHS
			case 63: return .DOUBT
			case 64: return .COMPETITION
			case 65: return .CHANGE
			case 66: return .LIBERATION
			case 67: return .SUBMISSION
			case 68: return .HEALTH
			case 69: return .CONFIDENCE
			case 70: return .ACCEPTANCE
			case 71: return .COMPANY
			case 72: return .ELITE
			case 73: return .MEEK
			case 74: return .WORTHY
			case 75: return .EQUIPMENT
			case 76: return .REPRESENTATIVE
			case 77: return .ACADEMIA
			case 78: return .BEAUTY
			case 79: return .DELIGHT
			case 80: return .PAIN
			case 81: return .ASSISTANCE
			case 82: return .NEWS
			case 83: return .VISIONS
			case 84: return .DISCOVERY
			case 85: return .GOVERNMENT
			case 86: return .DIRECTION
			case 87: return .GROWTH
			case 88: return .VOYAGE
			case 89: return .LANGUAGE
			case 90: return .MUSIC
			case 91: return .DISTRIBUTION
			case 92: return .CONTRACT
			case 93: return .SENSUALITY
			case 94: return .ANGER
			case 95: return .WRATH
			case 96: return .THEORIES
			case 97: return .CONSPIRACY
			case 98: return .CHARITY
			case 99: return .MEDICINE
			case 100: return .WELLBEING
			default: return .NONE
		}
	}
}

enum CYPHER_CHARACTER_MOTIVATION: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_MOTIVATION

	static var MIN: Int = 1
	static var MAX: Int = 20

	case KNOWLEDGE
	case POWER
	case EXPLORATION
	case ADVENTURE
	case MURDER
	case MONEY
	case SECURITY
	case REVENGE
	case REDEMPTION
	case PROTECTION
	case FAME
	case INFORMATION
	case VALIDATION
	case NOTORIETY
	case FREEDOM
	case NETWORKING
	case DESTRUCTION
	case POLITICAL
	case HONOUR
	case BUSINESS
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_MOTIVATION {
		switch value {
			case 1: return .KNOWLEDGE
			case 2: return .POWER
			case 3: return .EXPLORATION
			case 4: return .ADVENTURE
			case 5: return .MURDER
			case 6: return .MONEY
			case 7: return .SECURITY
			case 8: return .REVENGE
			case 9: return .REDEMPTION
			case 10: return .PROTECTION
			case 11: return .FAME
			case 12: return .INFORMATION
			case 13: return .VALIDATION
			case 14: return .NOTORIETY
			case 15: return .FREEDOM
			case 16: return .NETWORKING
			case 17: return .DESTRUCTION
			case 18: return .POLITICAL
			case 19: return .HONOUR
			case 20: return .BUSINESS
			default: return .NONE
		}
	}

}




enum CYPHER_CHARACTER_INTERACTION_EMOTIONAL_TONE: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_INTERACTION_EMOTIONAL_TONE

	static var MIN: Int = 1
	static var MAX: Int = 100

	case JOVIAL
	case WITHDRAWN
	case HAPPY
	case AMAZED
	case FOOLISH
	case OVERWHELMED
	case ANGRY
	case FRUSTRATED
	case PEACEFUL
	case ANNOYED
	case FURIOUS
	case PROUD
	case ANXIOUS
	case GRIEVING
	case RELIEVED
	case ASHAMED
	case RESENTFUL
	case BITTER
	case HOPEFUL
	case SAD
	case BORED
	case HURT
	case SATISFIED
	case COMFORTABLE
	case INADEQUATE
	case SCARED
	case CONFUSED
	case INSECURE
	case SELF_CONSCIOUS
	case CONTENT
	case INSPIRED
	case SHOCKED
	case DEPRESSED
	case IRRITATED
	case SILLY
	case DETERMINED
	case JEALOUS
	case STUPID
	case DISDAIN
	case JOYOUS
	case SUSPICIOUS
	case DISGUSTED
	case LONELY
	case TENSE
	case EAGER
	case LOST
	case TERRIFIED
	case EMBARRASSED
	case LOVING
	case TRAPPED
	case ENERGETIC
	case MISERABLE
	case UNCOMFORTABLE
	case ENVIOUS
	case MOTIVATED
	case WORRIED
	case NERVOUS
	case WORTHLESS
	case HOSTILE
	case AGITATED
	case RESTLESS
	case EXCITED
	case ELATED
	case EUPHORIC
	case DESPONDENT
	case ARROGANT
	case DRIVEN
	case UPSET
	case PESSIMISTIC
	case APPALLED
	case DOUBTFUL
	case OPTIMISTIC
	case VALUED
	case SMARMY
	case BELLIGERENT
	case ECSTATIC
	case UNDERWHELMED
	case ANGST
	case UNSETTLED
	case RELAXED
	case CHILLED
	case FEARFUL
	case ALARMED
	case HORRIFIED
	case WISTFUL
	case MOROSE
	case DISAPPOINTED
	case GRATEFUL
	case AMBIVALENT
	case BEREFT
	case ZEN
	case GLOOMY
	case CARING
	case ABASHED
	case BASHFUL
	case POSITIVE
	case NEGATIVE
	case ROSY
	case HYSTERICAL
	case TRANQUIL
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_INTERACTION_EMOTIONAL_TONE {
		switch value {
			case 1: return .JOVIAL
			case 2: return .WITHDRAWN
			case 3: return .HAPPY
			case 4: return .AMAZED
			case 5: return .FOOLISH
			case 6: return .OVERWHELMED
			case 7: return .ANGRY
			case 8: return .FRUSTRATED
			case 9: return .PEACEFUL
			case 10: return .ANNOYED
			case 11: return .FURIOUS
			case 12: return .PROUD
			case 13: return .ANXIOUS
			case 14: return .GRIEVING
			case 15: return .RELIEVED
			case 16: return .ASHAMED
			case 17: return .RESENTFUL
			case 18: return .BITTER
			case 19: return .HOPEFUL
			case 20: return .SAD
			case 21: return .BORED
			case 22: return .HURT
			case 23: return .SATISFIED
			case 24: return .COMFORTABLE
			case 25: return .INADEQUATE
			case 26: return .SCARED
			case 27: return .CONFUSED
			case 28: return .INSECURE
			case 29: return .SELF_CONSCIOUS
			case 30: return .CONTENT
			case 31: return .INSPIRED
			case 32: return .SHOCKED
			case 33: return .DEPRESSED
			case 34: return .IRRITATED
			case 35: return .SILLY
			case 36: return .DETERMINED
			case 37: return .JEALOUS
			case 38: return .STUPID
			case 39: return .DISDAIN
			case 40: return .JOYOUS
			case 41: return .SUSPICIOUS
			case 42: return .DISGUSTED
			case 43: return .LONELY
			case 44: return .TENSE
			case 45: return .EAGER
			case 46: return .LOST
			case 47: return .TERRIFIED
			case 48: return .EMBARRASSED
			case 49: return .LOVING
			case 50: return .TRAPPED
			case 51: return .ENERGETIC
			case 52: return .MISERABLE
			case 53: return .UNCOMFORTABLE
			case 54: return .ENVIOUS
			case 55: return .MOTIVATED
			case 56: return .WORRIED
			case 57: return .NERVOUS
			case 58: return .WORTHLESS
			case 59: return .HOSTILE
			case 60: return .AGITATED
			case 61: return .RESTLESS
			case 62: return .EXCITED
			case 63: return .ELATED
			case 64: return .EUPHORIC
			case 65: return .DESPONDENT
			case 66: return .ARROGANT
			case 67: return .DRIVEN
			case 68: return .UPSET
			case 69: return .PESSIMISTIC
			case 70: return .APPALLED
			case 71: return .DOUBTFUL
			case 72: return .OPTIMISTIC
			case 73: return .VALUED
			case 74: return .SMARMY
			case 75: return .BELLIGERENT
			case 76: return .ECSTATIC
			case 77: return .UNDERWHELMED
			case 78: return .ANGST
			case 79: return .UNSETTLED
			case 80: return .RELAXED
			case 81: return .CHILLED
			case 82: return .FEARFUL
			case 83: return .ALARMED
			case 84: return .HORRIFIED
			case 85: return .WISTFUL
			case 86: return .MOROSE
			case 87: return .DISAPPOINTED
			case 88: return .GRATEFUL
			case 89: return .AMBIVALENT
			case 90: return .BEREFT
			case 91: return .ZEN
			case 92: return .GLOOMY
			case 93: return .CARING
			case 94: return .ABASHED
			case 95: return .BASHFUL
			case 96: return .POSITIVE
			case 97: return .NEGATIVE
			case 98: return .ROSY
			case 99: return .HYSTERICAL
			case 100: return .TRANQUIL
			default: return .NONE
		}
	}
}



enum CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_A: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_A

	static var MIN: Int = 1
	static var MAX: Int = 100

	case SCHEMING
	case INSANE
	case CRAZY
	case MALEVOLENT
	case DEFENSIVE
	case BIASED
	case OPEN
	case FRIENDLY
	case HOSTILE
	case PREJUDICED
	case AGGRESSIVE
	case ACCUSATORY
	case WELCOMING
	case QUESTIONING
	case INQUISITIVE
	case COCKY
	case KNOWING
	case SHARING
	case SECRETIVE
	case SEDUCTIVE
	case REDUCTIVE
	case REASONABLE
	case MYSTERIOUS
	case FOCUSED
	case INFORMATIVE
	case DECEITFUL
	case MANIPULATIVE
	case HONEST
	case FAKE
	case GENUINE
	case SENSELESS
	case CARELESS
	case MEASURED
	case GUARDED
	case BOASTFUL
	case MODEST
	case HUMBLE
	case INSULTING
	case COMPLIMENTARY
	case TETCHY
	case DISHONEST
	case SMARMY
	case ARROGANT
	case SURE
	case HESITANT
	case UNSURE
	case TRUSTING
	case FUNNY
	case SULTRY
	case SMOULDERING
	case SEXUAL
	case MURDEROUS
	case WHISPERING
	case GENTLE
	case CALMING
	case CHALLENGING
	case QUIET
	case LOUD
	case TALKATIVE
	case DETAILED
	case OBSESSIVE
	case BORING
	case SLEEPY
	case EAGER
	case FLIPPANT
	case WILLING
	case HOPEFUL
	case BRAGGING
	case ANNOYING
	case FAR_FETCHED
	case UNLIKELY
	case UNUSUAL
	case DRAWL
	case MUDDLED
	case MISLEADING
	case SUSPICIOUS
	case NAIVE
	case NASTY
	case KINDLY
	case NICE
	case CONTRADICTORY
	case CONFUSING
	case CLEAR
	case FIRM
	case DEMANDING
	case STUBBORN
	case REASSURING
	case COMPLAINING
	case RESISTING
	case HYPNOTIC
	case INSPIRING
	case MOTIVATING
	case NEUROTIC
	case ASSURED
	case CONVINCING
	case HARMONIOUS
	case CONCURRENT
	case VORACIOUS
	case VICIOUS
	case CONNIVING
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_A {
		switch value {
			case 1: return .SCHEMING
			case 2: return .INSANE
			case 3: return .CRAZY
			case 4: return .MALEVOLENT
			case 5: return .DEFENSIVE
			case 6: return .BIASED
			case 7: return .OPEN
			case 8: return .FRIENDLY
			case 9: return .HOSTILE
			case 10: return .PREJUDICED
			case 11: return .AGGRESSIVE
			case 12: return .ACCUSATORY
			case 13: return .WELCOMING
			case 14: return .QUESTIONING
			case 15: return .INQUISITIVE
			case 16: return .COCKY
			case 17: return .KNOWING
			case 18: return .SHARING
			case 19: return .SECRETIVE
			case 20: return .SEDUCTIVE
			case 21: return .REDUCTIVE
			case 22: return .REASONABLE
			case 23: return .MYSTERIOUS
			case 24: return .FOCUSED
			case 25: return .INFORMATIVE
			case 26: return .DECEITFUL
			case 27: return .MANIPULATIVE
			case 28: return .HONEST
			case 29: return .FAKE
			case 30: return .GENUINE
			case 31: return .SENSELESS
			case 32: return .CARELESS
			case 33: return .MEASURED
			case 34: return .GUARDED
			case 35: return .BOASTFUL
			case 36: return .MODEST
			case 37: return .HUMBLE
			case 38: return .INSULTING
			case 39: return .COMPLIMENTARY
			case 40: return .TETCHY
			case 41: return .DISHONEST
			case 42: return .SMARMY
			case 43: return .ARROGANT
			case 44: return .SURE
			case 45: return .HESITANT
			case 46: return .UNSURE
			case 47: return .TRUSTING
			case 48: return .FUNNY
			case 49: return .SULTRY
			case 50: return .SMOULDERING
			case 51: return .SEXUAL
			case 52: return .MURDEROUS
			case 53: return .WHISPERING
			case 54: return .GENTLE
			case 55: return .CALMING
			case 56: return .CHALLENGING
			case 57: return .QUIET
			case 58: return .LOUD
			case 59: return .TALKATIVE
			case 60: return .DETAILED
			case 61: return .OBSESSIVE
			case 62: return .BORING
			case 63: return .SLEEPY
			case 64: return .EAGER
			case 65: return .FLIPPANT
			case 66: return .WILLING
			case 67: return .HOPEFUL
			case 68: return .BRAGGING
			case 69: return .ANNOYING
			case 70: return .FAR_FETCHED
			case 71: return .UNLIKELY
			case 72: return .UNUSUAL
			case 73: return .DRAWL
			case 74: return .MUDDLED
			case 75: return .MISLEADING
			case 76: return .SUSPICIOUS
			case 77: return .NAIVE
			case 78: return .NASTY
			case 79: return .KINDLY
			case 80: return .NICE
			case 81: return .CONTRADICTORY
			case 82: return .CONFUSING
			case 83: return .CLEAR
			case 84: return .FIRM
			case 85: return .DEMANDING
			case 86: return .STUBBORN
			case 87: return .REASSURING
			case 88: return .COMPLAINING
			case 89: return .RESISTING
			case 90: return .HYPNOTIC
			case 91: return .INSPIRING
			case 92: return .MOTIVATING
			case 93: return .NEUROTIC
			case 94: return .ASSURED
			case 95: return .CONVINCING
			case 96: return .HARMONIOUS
			case 97: return .CONCURRENT
			case 98: return .VORACIOUS
			case 99: return .VICIOUS
			case 100: return .CONNIVING
			default: return .NONE
		}
	}
}


enum CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_B: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_B

	static var MIN: Int = 1
	static var MAX: Int = 100

	case ILLUSION
	case TRUST
	case MAGIC
	case RUMOURS
	case FEARS
	case DREAMS
	case ADVERSARIES
	case LEADERSHIP
	case CREATURES
	case WEAPONS
	case POWER
	case FOOD
	case SUCCESS
	case FAILURE
	case SUPPLIES
	case PLANS
	case BUSINESS
	case TECHNOLOGY
	case WEATHER
	case MONEY
	case DANGER
	case EVIL
	case GOOD
	case NORMALITY
	case IDEAS
	case COMPETITION
	case ARISTOCRACY
	case BUREAUCRACY
	case NEWS
	case DRUGS
	case FREEDOM
	case OPPRESSION
	case DEATH
	case CONSPIRACY
	case ART
	case EMOTIONS
	case ESPIONAGE
	case TREASON
	case NEGLECT
	case BETRAYAL
	case PLEASURE
	case PRAISE
	case SECRETS
	case HISTORY
	case VIEWS
	case IDIOCY
	case COMFORT
	case JUDGEMENT
	case MYSTERY
	case SCEPTICISM
	case TRADE
	case INFORMATION
	case MISDIRECTION
	case REPORTS
	case REQUESTS
	case WORK
	case PROGRESS
	case ASSOCIATES
	case POLITICS
	case SPORT
	case SCIENCE
	case PATRONS
	case DEBTORS
	case SUPPORTERS
	case HARMONY
	case PROSPERITY
	case ILLNESS
	case HEALTH
	case FRIENDS
	case PRIDE
	case CHARITY
	case INTENT
	case FORMULA
	case INSTRUMENTS
	case EQUIPMENT
	case TOOLS
	case SKILLS
	case LEGENDS
	case GHOSTS
	case SPIRITS
	case VIGILANCE
	case PROPAGANDA
	case WORSHIP
	case ACADEMIA
	case SLAVERY
	case WORRIES
	case GAMES
	case COMPOSURE
	case ENVY
	case VALOUR
	case GREED
	case RIDDLES
	case LUST
	case BELIEFS
	case RELIGION
	case CONTRABAND
	case RELICS
	case STRUCTURES
	case PROPERTY
	case OWNERSHIP
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_INTERACTION_DESCRIPTOR_B {
		switch value {
			case 1: return .ILLUSION
			case 2: return .TRUST
			case 3: return .MAGIC
			case 4: return .RUMOURS
			case 5: return .FEARS
			case 6: return .DREAMS
			case 7: return .ADVERSARIES
			case 8: return .LEADERSHIP
			case 9: return .CREATURES
			case 10: return .WEAPONS
			case 11: return .POWER
			case 12: return .FOOD
			case 13: return .SUCCESS
			case 14: return .FAILURE
			case 15: return .SUPPLIES
			case 16: return .PLANS
			case 17: return .BUSINESS
			case 18: return .TECHNOLOGY
			case 19: return .WEATHER
			case 20: return .MONEY
			case 21: return .DANGER
			case 22: return .EVIL
			case 23: return .GOOD
			case 24: return .NORMALITY
			case 25: return .IDEAS
			case 26: return .COMPETITION
			case 27: return .ARISTOCRACY
			case 28: return .BUREAUCRACY
			case 29: return .NEWS
			case 30: return .DRUGS
			case 31: return .FREEDOM
			case 32: return .OPPRESSION
			case 33: return .DEATH
			case 34: return .CONSPIRACY
			case 35: return .ART
			case 36: return .EMOTIONS
			case 37: return .ESPIONAGE
			case 38: return .TREASON
			case 39: return .NEGLECT
			case 40: return .BETRAYAL
			case 41: return .PLEASURE
			case 42: return .PRAISE
			case 43: return .SECRETS
			case 44: return .HISTORY
			case 45: return .VIEWS
			case 46: return .IDIOCY
			case 47: return .COMFORT
			case 48: return .JUDGEMENT
			case 49: return .MYSTERY
			case 50: return .SCEPTICISM
			case 51: return .TRADE
			case 52: return .INFORMATION
			case 53: return .MISDIRECTION
			case 54: return .REPORTS
			case 55: return .REQUESTS
			case 56: return .WORK
			case 57: return .PROGRESS
			case 58: return .ASSOCIATES
			case 59: return .POLITICS
			case 60: return .SPORT
			case 61: return .SCIENCE
			case 62: return .PATRONS
			case 63: return .DEBTORS
			case 64: return .SUPPORTERS
			case 65: return .HARMONY
			case 66: return .PROSPERITY
			case 67: return .ILLNESS
			case 68: return .HEALTH
			case 69: return .FRIENDS
			case 70: return .PRIDE
			case 71: return .CHARITY
			case 72: return .INTENT
			case 73: return .FORMULA
			case 74: return .INSTRUMENTS
			case 75: return .EQUIPMENT
			case 76: return .TOOLS
			case 77: return .SKILLS
			case 78: return .LEGENDS
			case 79: return .GHOSTS
			case 80: return .SPIRITS
			case 81: return .VIGILANCE
			case 82: return .PROPAGANDA
			case 83: return .WORSHIP
			case 84: return .ACADEMIA
			case 85: return .SLAVERY
			case 86: return .WORRIES
			case 87: return .GAMES
			case 88: return .COMPOSURE
			case 89: return .ENVY
			case 90: return .VALOUR
			case 91: return .GREED
			case 92: return .RIDDLES
			case 93: return .LUST
			case 94: return .BELIEFS
			case 95: return .RELIGION
			case 96: return .CONTRABAND
			case 97: return .RELICS
			case 98: return .STRUCTURES
			case 99: return .PROPERTY
			case 100: return .OWNERSHIP
			default: return .NONE
		}
	}
}



enum CYPHER_CHARACTER_INTERACTION_FOCUS: String, RPG_TABLE, Codable {
	typealias Result = CYPHER_CHARACTER_INTERACTION_FOCUS

	static var MIN: Int = 1
	static var MAX: Int = 100

	case PROTAGONIST
	case ANTAGONIST
	case WEALTH
	case POVERTY
	case CURRENT_SCENE
	case PREVIOUS_SCENE
	case CURRENT_EVENTS
	case PREVIOUS_EVENTS
	case PARENTS
	case CHILDREN
	case FAMILY
	case FRIENDS
	case ENEMIES
	case MUTUAL_ACQUAINTANCE
	case NON_MUTUAL_ACQUAINTANCE
	case HISTORY
	case FUTURE
	case COMPETITORS
	case PARTNERS
	case SAINTS
	case SINNERS
	case WINNER
	case LOSER
	case STRENGTH
	case WEAKNESS
	case LAST_ACTION
	case NEXT_ACTION
	case REWARDS
	case PENALTIES
	case TRUTH
	case LIES
	case KNOWLEDGE
	case IGNORANCE
	case SUPERIORS
	case INFERIORS
	case RELIGION
	case SCIENCE
	case LOVE
	case HATE
	case INTENTION
	case ACCIDENT
	case HOPE
	case DESPAIR
	case DAY
	case NIGHT
	case WAR
	case PEACE
	case DISCOVERY
	case LOSS
	case HIDDEN
	case REVEALED
	case LOCATION
	case MAP
	case LOCAL
	case FOREIGN
	case UNKNOWN
	case KNOWN
	case HONOUR
	case SLANDER
	case COMMUNITY
	case TREASURE
	case ALLIES
	case CAMPAIGN
	case ADVENTURE
	case GOALS
	case OBJECTIVES
	case TASKS
	case GOSSIP
	case HEARSAY
	case NETWORK
	case GOOD
	case EVIL
	case TIDINGS
	case POSSIBILITIES
	case OBSTACLES
	case WORKAROUNDS
	case TACTICS
	case FOOD
	case DRINK
	case LODGINGS
	case A_PLAYER_CHARACTER
	case A_NON_PLAYER_CHARACTER
	case A_VILLAIN
	case WEAPONS
	case RELICS
	case THE_WORLD
	case POWERS
	case FLAWS
	case OVERSIGHT
	case ERRORS
	case A_MISSING_PERSON
	case INVESTMENT
	case A_SETTLEMENT
	case ARTIFACT
	case LEGALITIES
	case LOGISTICS
	case CONTACTS
	case EXPERIENCE
	case A_MISSION
	case EMPLOYMENT
	case NONE

	var descriptionShort: String { get {
		return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> CYPHER_CHARACTER_INTERACTION_FOCUS {
		switch value {
			case 1: return .PROTAGONIST
			case 2: return .ANTAGONIST
			case 3: return .WEALTH
			case 4: return .POVERTY
			case 5: return .CURRENT_SCENE
			case 6: return .PREVIOUS_SCENE
			case 7: return .CURRENT_EVENTS
			case 8: return .PREVIOUS_EVENTS
			case 9: return .PARENTS
			case 10: return .CHILDREN
			case 11: return .FAMILY
			case 12: return .FRIENDS
			case 13: return .ENEMIES
			case 14: return .MUTUAL_ACQUAINTANCE
			case 15: return .NON_MUTUAL_ACQUAINTANCE
			case 16: return .HISTORY
			case 17: return .FUTURE
			case 18: return .COMPETITORS
			case 19: return .PARTNERS
			case 20: return .SAINTS
			case 21: return .SINNERS
			case 22: return .WINNER
			case 23: return .LOSER
			case 24: return .STRENGTH
			case 25: return .WEAKNESS
			case 26: return .LAST_ACTION
			case 27: return .NEXT_ACTION
			case 28: return .REWARDS
			case 29: return .PENALTIES
			case 30: return .TRUTH
			case 31: return .LIES
			case 32: return .KNOWLEDGE
			case 33: return .IGNORANCE
			case 34: return .SUPERIORS
			case 35: return .INFERIORS
			case 36: return .RELIGION
			case 37: return .SCIENCE
			case 38: return .LOVE
			case 39: return .HATE
			case 40: return .INTENTION
			case 41: return .ACCIDENT
			case 42: return .HOPE
			case 43: return .DESPAIR
			case 44: return .DAY
			case 45: return .NIGHT
			case 46: return .WAR
			case 47: return .PEACE
			case 48: return .DISCOVERY
			case 49: return .LOSS
			case 50: return .HIDDEN
			case 51: return .REVEALED
			case 52: return .LOCATION
			case 53: return .MAP
			case 54: return .LOCAL
			case 55: return .FOREIGN
			case 56: return .UNKNOWN
			case 57: return .KNOWN
			case 58: return .HONOUR
			case 59: return .SLANDER
			case 60: return .COMMUNITY
			case 61: return .TREASURE
			case 62: return .ALLIES
			case 63: return .CAMPAIGN
			case 64: return .ADVENTURE
			case 65: return .GOALS
			case 66: return .OBJECTIVES
			case 67: return .TASKS
			case 68: return .GOSSIP
			case 69: return .HEARSAY
			case 70: return .NETWORK
			case 71: return .GOOD
			case 72: return .EVIL
			case 73: return .TIDINGS
			case 74: return .POSSIBILITIES
			case 75: return .OBSTACLES
			case 76: return .WORKAROUNDS
			case 77: return .TACTICS
			case 78: return .FOOD
			case 79: return .DRINK
			case 80: return .LODGINGS
			case 81: return .A_PLAYER_CHARACTER
			case 82: return .A_NON_PLAYER_CHARACTER
			case 83: return .A_VILLAIN
			case 84: return .WEAPONS
			case 85: return .RELICS
			case 86: return .THE_WORLD
			case 87: return .POWERS
			case 88: return .FLAWS
			case 89: return .OVERSIGHT
			case 90: return .ERRORS
			case 91: return .A_MISSING_PERSON
			case 92: return .INVESTMENT
			case 93: return .A_SETTLEMENT
			case 94: return .ARTIFACT
			case 95: return .LEGALITIES
			case 96: return .LOGISTICS
			case 97: return .CONTACTS
			case 98: return .EXPERIENCE
			case 99: return .A_MISSION
			case 100: return .EMPLOYMENT
			default: return .NONE
		}
	}
}
