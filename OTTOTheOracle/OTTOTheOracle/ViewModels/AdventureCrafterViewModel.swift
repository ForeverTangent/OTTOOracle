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

	@Published var themes = [AdventureCrafterThemeViewModel]()
	@Published var plotPoints = [PlotPointsViewModel]()

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
		themes = acThemeStrings
		print(themes)
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


	func generateNewAdventureThemesModel() {
		adventureCrafterModel.buildNewAdventureThemesModel()
		getAdventureThemesForViewModel()
	}


	func generateNewTurningPointPlotPoints() {
		guard let theTurningPoint = adventureCrafterModel.getRandomTurningPoint() else {
			print("return")
			return }

		let formattedPlotPoints = getFormattedPlotPoints(theTurningPoint.plotPoints)

		plotPoints = formattedPlotPoints
	}


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
