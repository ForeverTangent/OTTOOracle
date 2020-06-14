//
//  AdventureCrafterViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

/**
https://stackoverflow.com/a/28288340/9760718
*/
extension StringProtocol {
	var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
	var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

class AdventureCrafterViewModel: ObservableObject {
	var adventureCrafterModel = AdventureCrafterModel()

	@Published var adventureThemesViewModel = [AdventureCrafterThemeViewModel]()
	@Published var plotPointsViewModel = [PlotPointsViewModel]()
	@Published var characterDataViewModel = CharacterDataViewModel(
		name: "",
		identities: [CharacterDataIdentiesViewModel](),
		descriptors: [CharacterDataDescriptorsViewModel]())

	init() {
		generateNewAdventureThemesModel()

		getAdventureThemesForViewModel()
		generateNewTurningPointPlotPoints()
	}


	func getAdventureThemesForViewModel() {
		guard let theAdventureThemeModel = adventureCrafterModel.adventureModel else {
			return
		}

		let acThemes = theAdventureThemeModel.themes
		let acThemesByPrority = acThemes.getThemesByPriority()
		let acThemeStrings = acThemesByPrority.map { AdventureCrafterThemeViewModel(theme: $0.rawValue)	}
		adventureThemesViewModel = acThemeStrings
		print(adventureThemesViewModel)
	}


	func getFormattedPlotPoints(_ plotPoints: [ADVENTURE_PLOT_POINTS]) -> [PlotPointsViewModel] {
		let formattedPlotPoints: [PlotPointsViewModel] = plotPoints.map { (adventurePlotPoint) in
			var plotPointsViewModel: PlotPointsViewModel = PlotPointsViewModel(plotPoint: "")
			if adventurePlotPoint != .NONE && adventurePlotPoint != .META {
				var plotPointString = adventurePlotPoint.rawValue
				plotPointString = plotPointString.replacingOccurrences(of: "META_", with: "")
				plotPointString = plotPointString.replacingOccurrences(of: "_", with: " ")
				plotPointString = plotPointString.capitalized
				plotPointsViewModel = PlotPointsViewModel(plotPoint: plotPointString)
			}
			return plotPointsViewModel
		}

		return formattedPlotPoints
	}


	func getCharacterData() {
		guard let theCharacterData = adventureCrafterModel.character else {
			return
		}

		let formattedCharacterData = getFormattedCharacterData(theCharacterData)

		characterDataViewModel = formattedCharacterData

	}


	func getFormattedCharacterData(_ characterData: CharacterData) -> CharacterDataViewModel {
		var identities = [CharacterDataIdentiesViewModel]()
		var descriptors = [CharacterDataDescriptorsViewModel]()

		for element in characterData.identity {
			let newCDIdentiryVM = CharacterDataIdentiesViewModel(identity: element.rawValue)
			identities.append(newCDIdentiryVM)
		}

		for element in characterData.descriptors {
			let newCDDescriptorVM = CharacterDataDescriptorsViewModel(descriptor: element.rawValue)
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
		guard let theTurningPoint = adventureCrafterModel.getRandomTurningPoint() else {
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
	var descriptor: String

}


struct PlotPointsViewModel: Identifiable {
	var id = UUID()
	var plotPoint: String

	init(plotPoint: String) {
		self.plotPoint = plotPoint
	}
}


class AdventureCrafterThemeViewModel: Identifiable {
	var id: String { get { title } }
	var title: String

	init(theme: String) {
		self.title = theme
	}
}
