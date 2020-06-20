//
//  AdventureCrafterViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class AdventureCrafterViewModel: ObservableObject {
	var adventureCrafterModel = AdventureCrafterModel()

	@Published var adventureThemesViewModel = [AdventureCrafterThemeViewModel]()
	@Published var plotPointsViewModel = [PlotPointsViewModel]()
	@Published var characterDataViewModel = CharacterDataViewModel(
		name: "",
		identities: [CharacterDataIdentiesViewModel](),
		descriptors: [CharacterDataDescriptorsViewModel]())


	init() {
//		generateNewAdventureThemesModel()
//		generateNewTurningPointPlotPoints()
//		generateNewCharacter()

		getAdventureThemesForViewModel()
	}


	public func getAdventureThemesForViewModel() {
		guard let theAdventureThemeModel = adventureCrafterModel.getThemes() else { return }
		let acThemes = theAdventureThemeModel
		let acThemesByPrority = acThemes.getThemesByPriority()
		let acThemeStrings = acThemesByPrority.map { AdventureCrafterThemeViewModel(theme: $0.rawValue)	}
		adventureThemesViewModel = acThemeStrings
	}


	public func getTurningPointIndex(_ turningPointIndex: Int) -> TuringPoint? {
		guard let theTurningPoint = adventureCrafterModel.getTurningPoint(index: turningPointIndex) else {
			return nil
		}
		return theTurningPoint
	}


	func getFormattedPlotPoints(_ plotPoints: [Int: ADVENTURE_PLOT_POINTS]) -> [PlotPointsViewModel] {
		let formattedPlotPoints: [PlotPointsViewModel] = plotPoints.map { (key: Int, value: ADVENTURE_PLOT_POINTS) in
			let plotPointsViewModel: PlotPointsViewModel = PlotPointsViewModel(index: key,
																			   descriptionShort: value.descriptionShort,
																			   descriptionLong: value.descriptionLong)
			return plotPointsViewModel
		}
		return formattedPlotPoints
	}


	func getLongDescriptionOfPlotPoint(_ plotPoint: ADVENTURE_PLOT_POINTS) -> String {
		return plotPoint.descriptionLong
	}


	func getCharacterData() {
		guard let theCharacterData = adventureCrafterModel.character else { return }
		let formattedCharacterData = getFormattedCharacterData(theCharacterData)
		characterDataViewModel = formattedCharacterData
	}


	func getFormattedCharacterData(_ characterData: CharacterData) -> CharacterDataViewModel {
		var identities = [CharacterDataIdentiesViewModel]()
		var descriptors = [CharacterDataDescriptorsViewModel]()

		for element in characterData.identity {
			let newCDIdentiryVM = CharacterDataIdentiesViewModel(identity: element.descriptionShort)
			identities.append(newCDIdentiryVM)
		}

		for element in characterData.descriptors {
			let newCDDescriptorVM = CharacterDataDescriptorsViewModel(descriptorShort: element.descriptionShort,
																	  descriptorLong: element.descriptionLong)
			descriptors.append(newCDDescriptorVM)
		}

		let totalCharacterDataVM = CharacterDataViewModel(name: "ASDF",
														  identities: identities,
														  descriptors: descriptors)
		return totalCharacterDataVM
	}


	func generateNewAdventureThemesModel() {
		adventureCrafterModel.buildNewAdventureThemesModel()
		getAdventureThemesForViewModel()
	}


	func generateNewTurningPointPlotPoints() {
		guard let theTurningPoint = adventureCrafterModel.buildRandomTurningPoint() else {
			print("return")
			return }

		let formattedPlotPoints = getFormattedPlotPoints(theTurningPoint.plotPoints)

		plotPointsViewModel = formattedPlotPoints
	}

	func generateNewCharacter() {
		adventureCrafterModel.buildNewCharacter()
		getCharacterData()
	}


}


struct CharacterDataViewModel: Identifiable {
	var id = UUID()
	var name: String
	var identities: [CharacterDataIdentiesViewModel]
	var descriptors: [CharacterDataDescriptorsViewModel]

}

struct CharacterDataIdentiesViewModel: Identifiable {
	var id = UUID()
	var identity: String
}

struct CharacterDataDescriptorsViewModel: Identifiable {
	var id = UUID()
	var descriptorShort: String
	var descriptorLong: String

}


struct PlotPointsViewModel: Identifiable {
	var id: Int { get { return index } }
	var index: Int
	var descriptionShort: String
	var descriptionLong: String

	init(index: Int, descriptionShort: String, descriptionLong: String) {
		self.index = index
		self.descriptionShort = descriptionShort
		self.descriptionLong = descriptionLong
	}
}


class AdventureCrafterThemeViewModel: Identifiable {
	var id: String { get { return title } }
	var title: String

	init(theme: String) {
		self.title = theme
	}
}
