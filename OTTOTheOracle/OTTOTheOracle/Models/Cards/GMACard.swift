//
//  GMACard.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

// MARK: - GMACardElement
struct GMACard: Codable {
	var cardFile: String = "NONE"
	var difficulty: Int = 0
	var likelyOddsBad: GMACard_LikelyOdds = .NONE
	var likelyOddsEven: GMACard_LikelyOdds = .NONE
	var likelyOddsGood: GMACard_LikelyOdds = .NONE
	var d4: Int = 0
	var d6: Int = 0
	var d8: Int = 0
	var d10: Int = 0
	var d12: Int = 0
	var d20: Int = 0
	var d10Tens: Int = 0
	var d10Ones: Int = 0
	var rune: GMACard_Rune = .NONE
	var element: GMACard_Element = .NONE
	var description1: String = "NONE"
	var description2: String = "NONE"
	var description3: String = "NONE"
	var sensorySound: String = "NONE"
	var sensoryVisual: String = "NONE"
	var sensoryTouch: String = "NONE"
	var sensorySmell: String = "NONE"
	var tagSymbol1: GMACard_TagSymbol = .NONE
	var tagSymbol2: GMACard_TagSymbol = .NONE
	var tagSymbol3: GMACard_TagSymbol = .NONE
	var scatterSymbol: GMACard_ScatterSymbol = .NONE
	var belongings: String = "NONE"
	var catalyst: String = "NONE"
	var location: String = "NONE"
	var name1: String = "NONE"
	var name2: String = "NONE"
	var name3: String = "NONE"
	var virtue: GMACard_Virtue = .NONE
	var vice: GMACard_Vice = .NONE

	enum CodingKeys: String, CodingKey {
		case cardFile = "CARD_FILE"
		case difficulty = "DIFFICULTY"
		case likelyOddsBad = "LIKELY_ODDS_BAD"
		case likelyOddsEven = "LIKELY_ODDS_EVEN"
		case likelyOddsGood = "LIKELY_ODDS_GOOD"
		case d4 = "D4"
		case d6 = "D6"
		case d8 = "D8"
		case d10 = "D10"
		case d12 = "D12"
		case d20 = "D20"
		case d10Tens = "D10_TENS"
		case d10Ones = "D10_ONES"
		case rune = "RUNE"
		case element = "ELEMENT"
		case description1 = "DESCRIPTION_1"
		case description2 = "DESCRIPTION_2"
		case description3 = "DESCRIPTION_3"
		case sensorySound = "SENSORY_SOUND"
		case sensoryVisual = "SENSORY_VISUAL"
		case sensoryTouch = "SENSORY_TOUCH"
		case sensorySmell = "SENSORY_SMELL"
		case tagSymbol1 = "TAG_SYMBOL_1"
		case tagSymbol2 = "TAG_SYMBOL_2"
		case tagSymbol3 = "TAG_SYMBOL_3"
		case scatterSymbol = "SCATTER_SYMBOL"
		case belongings = "BELONGINGS"
		case catalyst = "CATALYST"
		case location = "LOCATION"
		case name1 = "NAME_1"
		case name2 = "NAME_2"
		case name3 = "NAME_3"
		case virtue = "VIRTUE"
		case vice = "VICE"
	}
}

extension GMACard: Comparable {
	static func < (lhs: GMACard, rhs: GMACard) -> Bool {
		lhs.cardFile < rhs.cardFile
	}
}


enum GMACard_Rune: String, RPG_TABLE, Codable {
	typealias Result = GMACard_Rune

	static var MIN: Int = 1
	static var MAX: Int = 24

	case ALGIZ_ᛉ
	case ANSUZ_ᚨ
	case BERKANO_ᛒ
	case DAGAZ_ᛞ
	case EHWAZ_ᛖ
	case EIHWAZ_ᛇ
	case FEHU_ᚠ
	case GEBO_ᚷ
	case HAGALAZ_ᚺ
	case INGWAZ_ᛜ
	case ISAZ_ᛁ
	case JERA_ᛃ
	case KENAZ_ᚲ
	case LAGIZ_ᛚ
	case MANNAZ_ᛗ
	case NAUDIZ_ᚾ
	case OTHALA_ᛟ
	case PERTHRO_ᛈ
	case RAIDO_ᚱ
	case SOWLIO_ᛋ
	case THURISAZ_ᚦ
	case TIRWAZ_ᛏ
	case URUZ_ᚢ
	case WUNJO_ᚹ
	case NONE

	var descriptionShort: String { get { return rawValue.capitalized.replacingOccurrences(of: "_", with: " ") } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> GMACard_Rune {
		switch value {
			case 1: return .ALGIZ_ᛉ
			case 2: return .ANSUZ_ᚨ
			case 3: return .BERKANO_ᛒ
			case 4: return .DAGAZ_ᛞ
			case 5: return .EHWAZ_ᛖ
			case 6: return .EIHWAZ_ᛇ
			case 7: return .FEHU_ᚠ
			case 8: return .GEBO_ᚷ
			case 9: return .HAGALAZ_ᚺ
			case 10: return .INGWAZ_ᛜ
			case 11: return .ISAZ_ᛁ
			case 12: return .JERA_ᛃ
			case 13: return .KENAZ_ᚲ
			case 14: return .LAGIZ_ᛚ
			case 15: return .MANNAZ_ᛗ
			case 16: return .NAUDIZ_ᚾ
			case 17: return .OTHALA_ᛟ
			case 18: return .PERTHRO_ᛈ
			case 19: return .RAIDO_ᚱ
			case 20: return .SOWLIO_ᛋ
			case 21: return .THURISAZ_ᚦ
			case 22: return .TIRWAZ_ᛏ
			case 23: return .URUZ_ᚢ
			case 24: return .WUNJO_ᚹ
			default: return .NONE
		}
	}
}


enum GMACard_Element: String, RPG_TABLE, Codable {
	typealias Result = GMACard_Element

	static var MIN: Int = 1
	static var MAX: Int = 4

	case AIR = "AIR_💨"
	case EARTH = "EARTH_🏔"
	case FIRE = "FIRE_🔥"
	case WATER = "WATER_💧"
	case NONE = "NONE"

	var descriptionShort: String { get { return rawValue.capitalized.replacingOccurrences(of: "_", with: " ") } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> GMACard_Element {
		switch value {
			case 1: return .AIR
			case 2: return .EARTH
			case 3: return .FIRE
			case 4: return .WATER
			default: return .NONE
		}
	}

}

enum GMACard_LikelyOdds: String, Codable {
	case noBang = "NO!"
	case yesBang = "YES!"
	case no = "NO"
	case yes = "YES"
	case NONE = "NONE"
}

enum GMACard_ScatterSymbol: String, Codable {
	case east = "EAST_→"
	case hit = "HIT_\u{1f4a5}"
	case miss = "MISS_–"
	case north = "NORTH_↑"
	case northeast = "NORTHEAST_↗︎"
	case northwest = "NORTHWEST_↖︎"
	case south = "SOUTH_↓"
	case southeast = "SOUTHEAST_↘︎"
	case southwest = "SOUTHWEST_↙︎"
	case west = "WEST_←"
	case NONE = "NONE"
}

enum GMACard_TagSymbol: String, RPG_TABLE, Codable {
	typealias Result = GMACard_TagSymbol

	static var MIN: Int = 1
	static var MAX: Int = 10

	case CROWN = "CROWN_👑"
	case HEART = "HEART_❤️"
	case MOON = "Moon_🌙"
	case SHIELD = "SHIELD_🛡"
	case SKULL = "SKULL_💀"
	case SUN = "SUN_☀️"
	case SWORD = "SWORD_⚔️"
	case TARGET = "TARGET_🎯"
	case TOWER = "TOWER_♖"
	case WAND = "WAND_𐃆"
	case NONE = "NONE"

	var descriptionShort: String { get { return rawValue.capitalized.replacingOccurrences(of: "_", with: " ") } }
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> GMACard_TagSymbol {
		switch value {
			case 1: return .CROWN
			case 2: return .HEART
			case 3: return .MOON
			case 4: return .SHIELD
			case 5: return .SKULL
			case 6: return .SUN
			case 7: return .SWORD
			case 8: return .TARGET
			case 9: return .TOWER
			case 10: return .WAND
			default: return .NONE
		}
	}
}

enum GMACard_Vice: String, Codable {
	case envy = "Envy"
	case fear = "Fear"
	case fraud = "Fraud"
	case gluttony = "Gluttony"
	case greed = "Greed"
	case lust = "Lust"
	case pride = "Pride"
	case sloth = "Sloth"
	case treachery = "Treachery"
	case wrath = "Wrath"
	case NONE = "NONE"
}

enum GMACard_Virtue: String, Codable {
	case charity = "Charity"
	case chastity = "Chastity"
	case compassion = "Compassion"
	case courage = "Courage"
	case diligence = "Diligence"
	case honesty = "Honesty"
	case humility = "Humility"
	case loyalty = "Loyalty"
	case mercy = "Mercy"
	case temperance = "Temperance"
	case NONE = "NONE"
}



