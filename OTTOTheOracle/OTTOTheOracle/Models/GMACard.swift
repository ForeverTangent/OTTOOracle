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
	var cardFile: String
	var difficulty: Int
	var likelyOddsBad, likelyOddsEven, likelyOddsGood: LikelyOdds
	var d4, d6, d8, d10: Int
	var d12, d20, d10Tens, d10Ones: Int
	var rune: String
	var element: Element
	var description1, description2, description3, sensorySound: String
	var sensoryVisual, sensoryTouch, sensorySmell: String
	var tagSymbol1, tagSymbol2, tagSymbol3: TagSymbol
	var scatterSymbol: ScatterSymbol
	var belongings, catalyst, location, name1: String
	var name2, name3: String
	var virtue: Virtue
	var vice: Vice

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

enum Element: String, Codable {
	case air = "Air_\u{1f701}"
	case earth = "Earth_\u{1f703}"
	case fire = "Fire_\u{1f702}"
	case water = "Water_\u{1f704}"
}

enum LikelyOdds: String, Codable {
	case likelyOddsNO = "NO!"
	case likelyOddsYES = "YES!"
	case no = "NO"
	case yes = "YES"
}

enum ScatterSymbol: String, Codable {
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
}

enum TagSymbol: String, Codable {
	case crown = "Crown_♔"
	case heart = "Heart_ ♥︎"
	case moon = "Moon_☽"
	case shield = "Shield_\u{1f6e1}"
	case skull = "Skull_\u{1f480}"
	case sun = "Sun_☀️"
	case sword = "Sword_⚔️"
	case target = "Target_\u{1f3af}"
	case tower = "Tower_♖"
	case wand = "Wand_\u{100c6}"
}

enum Vice: String, Codable {
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
}

enum Virtue: String, Codable {
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
}
