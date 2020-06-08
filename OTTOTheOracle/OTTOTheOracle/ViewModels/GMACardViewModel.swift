//
//  GMACardViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class GMACardViewModel {

	private var gmaCard = GMACard()
	private var runeToDescriptions = [GMACard_Rune: String]()
	private var elementToDescriptions = [GMACard_Element: String]()
	private var tagToDescriptions = [GMACard_TagSymbol: String]()

	var cardFile: String { get { return gmaCard.cardFile } }
	var difficulty: String { get { return "\(gmaCard.difficulty)" } }
	var likelyOddsBad: String { get { return "\(getLikelyOdds(gmaCard.likelyOddsBad))" } }
	var likelyOddsEven: String { get { return "\(getLikelyOdds(gmaCard.likelyOddsEven))" } }
	var likelyOddsGood: String { get { return "\(getLikelyOdds(gmaCard.likelyOddsGood))" } }
	var d4: String { get { return "\(gmaCard.d4)" } }
	var d6: String { get { return "\(gmaCard.d6)" } }
	var d8: String { get { return "\(gmaCard.d8)" } }
	var d10: String { get { return "\(gmaCard.d10)" } }
	var d12: String { get { return "\(gmaCard.d12)" } }
	var d20: String { get { return "\(gmaCard.d20)" } }
	var d10Tens: String { get { return "\(gmaCard.d10Tens)" } }
	var d10Ones: String { get { return "\(gmaCard.d10Ones)" } }
	var rune: String { get { return "\(getRune(gmaCard.rune))" } }
	var element: String { get { return "\(getElement(gmaCard.element))" } }
	var description1: String { get { return "\(gmaCard.description1)" } }
	var description2: String { get { return "\(gmaCard.description2)" } }
	var description3: String { get { return "\(gmaCard.description3)" } }
	var sensorySound: String { get { return "\(gmaCard.sensorySound)" } }
	var sensoryVisual: String { get { return "\(gmaCard.sensoryVisual)" } }
	var sensoryTouch: String { get { return "\(gmaCard.sensoryTouch)" } }
	var sensorySmell: String { get { return "\(gmaCard.sensorySmell)" } }
	var tagSymbol1: String { get { return "\(getTagSymbol(gmaCard.tagSymbol1))" } }
	var tagSymbol2: String { get { return "\(getTagSymbol(gmaCard.tagSymbol2))" } }
	var tagSymbol3: String { get { return "\(getTagSymbol(gmaCard.tagSymbol3))" } }
	var scatterSymbol: String { get { return "\(getScatterSymbol(gmaCard.scatterSymbol))" } }
	var belongings: String { get { return "\(gmaCard.belongings)" } }
	var catalyst: String { get { return "\(gmaCard.catalyst)" } }
	var location: String { get { return "\(gmaCard.location)" } }
	var name1: String { get { return "\(gmaCard.name1)" } }
	var name2: String { get { return "\(gmaCard.name2)" } }
	var name3: String { get { return "\(gmaCard.name3)" } }
	var virtue: String { get { return "\(gmaCard.virtue.rawValue)" } }
	var vice: String { get { return "\(gmaCard.vice.rawValue)" } }


	init(gmaCard: GMACard) {
		self.gmaCard = gmaCard
		loadGMARuneToDescription()
		loadGMAElementToDescription()
		loadGMATagToDescription()
	}

	func loadGMARuneToDescription() {

		let decoder = JSONDecoder()

		guard
			let path = Bundle.main.path(forResource:"RUNE_DESCRIPTIONS", ofType: "json"),
			let data = FileManager.default.contents(atPath: path) else {
				fatalError("Blarg")
		}

		do {
			runeToDescriptions = try decoder.decode([GMACard_Rune: String].self, from: data)
		} catch {
			print(error.localizedDescription)
		}
	}


	func loadGMAElementToDescription() {
		let decoder = JSONDecoder()

		guard
			let path = Bundle.main.path(forResource:"ELEMENT_DESCRIPTIONS", ofType: "json"),
			let data = FileManager.default.contents(atPath: path) else {
				fatalError("Blarg")
		}

		do {
			elementToDescriptions = try decoder.decode([GMACard_Element: String].self, from: data)
		} catch {
			print(error.localizedDescription)
		}
	}

	func loadGMATagToDescription() {
		let decoder = JSONDecoder()

		guard
			let path = Bundle.main.path(forResource:"TAG_DESCRIPTIONS", ofType: "json"),
			let data = FileManager.default.contents(atPath: path) else {
				fatalError("Blarg")
		}

		do {
			tagToDescriptions = try decoder.decode([GMACard_TagSymbol: String].self, from: data)
		} catch {
			print(error.localizedDescription)
		}

	}


	private func getLikelyOdds(_ likelyOdds: GMACard_LikelyOdds) -> String {
		switch likelyOdds {
			case .noBang:
				return "NO!"
			case .yesBang:
				return "YES!"
			case .no:
				return "No."
			case .yes:
				return "Yes."
			case .NONE:
				return "None"
		}
	}

	private func getRune(_ rune: GMACard_Rune) -> String {
		if
			rune != .NONE,
			let lastCharacter = rune.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	private func getElement(_ element: GMACard_Element) -> String {
		if
			element != .NONE,
			let lastCharacter = element.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	private func getTagSymbol(_ tagSymbol: GMACard_TagSymbol) -> String {
		if
			tagSymbol != .NONE,
			let lastCharacter = tagSymbol.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	private func getScatterSymbol(_ scatterSymbol: GMACard_ScatterSymbol) -> String {
		if
			scatterSymbol != .NONE,
			let lastCharacter = scatterSymbol.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	func getDescriptionForRune() -> String {
		guard let description = runeToDescriptions[gmaCard.rune] else { return "" }
		return description
	}

	func getDescriptionForElement() -> String {
		guard let description = elementToDescriptions[gmaCard.element] else { return "" }
		return description
	}

	func getDescriptionForTag1() -> String {
		guard let description = tagToDescriptions[gmaCard.tagSymbol1] else { return "" }
		return description
	}

	func getDescriptionForTag2() -> String {
		guard let description = tagToDescriptions[gmaCard.tagSymbol2] else { return "" }
		return description
	}

	func getDescriptionForTag3() -> String {
		guard let description = tagToDescriptions[gmaCard.tagSymbol3] else { return "" }
		return description
	}

}
