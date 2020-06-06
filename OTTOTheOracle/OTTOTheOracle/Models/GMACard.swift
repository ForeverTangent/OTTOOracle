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

enum GMACard_Rune: String, Codable {
	case Algiz_ᛉ = "Algiz_ᛉ"
	case Ansuz_ᚨ = "Ansuz_ᚨ"
	case Berkano_ᛒ = "Berkano_ᛒ"
	case Dagaz_ᛞ = "Dagaz_ᛞ"
	case Ehwaz_ᛖ = "Ehwaz_ᛖ"
	case Eihwaz_ᛇ = "Eihwaz_ᛇ"
	case Fehu_ᚠ = "Fehu_ᚠ"
	case Gebo_ᚷ = "Gebo_ᚷ"
	case Hagalaz_ᚺ = "Hagalaz_ᚺ"
	case Ingwaz_ᛜ = "Ingwaz_ᛜ"
	case Isaz_ᛁ = "Isaz_ᛁ"
	case Jera_ᛃ = "Jera_ᛃ"
	case Kenaz_ᚲ = "Kenaz_ᚲ"
	case Lagiz_ᛚ = "Lagiz_ᛚ"
	case Mannaz_ᛗ = "Mannaz_ᛗ"
	case Naudiz_ᚾ = "Naudiz_ᚾ"
	case Othala_ᛟ = "Othala_ᛟ"
	case Perthro_ᛈ = "Perthro_ᛈ"
	case Raido_ᚱ = "Raido_ᚱ"
	case Sowlio_ᛋ = "Sowlio_ᛋ"
	case Thurisaz_ᚦ = "Thurisaz_ᚦ"
	case Tirwas_ᛏ = "Tirwas_ᛏ"
	case Uruz_ᚢ = "Uruz_ᚢ"
	case Wunjo_ᚹ = "Wunjo_ᚹ"
	case NONE = "NONE"
}

enum GMACard_Element: String, Codable {
	case air = "Air_💨"
	case earth = "Earth_🏔"
	case fire = "Fire_🔥"
	case water = "Water_💧"
	case NONE = "NONE"
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

enum GMACard_TagSymbol: String, Codable {
	case crown = "Crown_👑"
	case heart = "Heart_ ♥︎"
	case moon = "Moon_🌙"
	case shield = "Shield_\u{1f6e1}"
	case skull = "Skull_\u{1f480}"
	case sun = "Sun_☀️"
	case sword = "Sword_⚔️"
	case target = "Target_\u{1f3af}"
	case tower = "Tower_♖"
	case wand = "Wand_\u{100c6}"
	case NONE = "NONE"
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



