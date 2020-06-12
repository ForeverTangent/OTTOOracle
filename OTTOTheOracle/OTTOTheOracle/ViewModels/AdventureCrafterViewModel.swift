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

	@Published var themes = [AdventureCrafterThemeViewModel]()
	@Published var turningPoint = TuringPoint()
	@Published var plotPoints = [TurningPlotPointViewModel]()

	init() {
		getACThemes()
		adventureCrafterModel.buildNewAdventureThemesModel()
		getTurningPoint()
	}

	func getACThemes() {
		guard let theAdventureThemeModel = adventureCrafterModel.adventureModel else { return }
		let acThemes = theAdventureThemeModel.themes
		let acThemesByPrority = acThemes.getThemesByPriority()
		let acThemeStrings = acThemesByPrority.map { AdventureCrafterThemeViewModel(theme: $0.rawValue)	}
		themes = acThemeStrings
		print(themes)
	}

	func getTurningPoint() {
		guard let theTurningPoint = adventureCrafterModel.getRandomTurningPoint() else {
			print("return")
			return }

		var thePlotPoints = [TurningPlotPointViewModel]()

		for (key, value) in theTurningPoint.plotPoints {
			let plotPoint = TurningPlotPointViewModel(priority: key, plotPoint: value)
			thePlotPoints.append(plotPoint)
		}

		thePlotPoints.sort{ $0.priority < $1.priority }

		plotPoints = thePlotPoints
	}

}

class TurningPlotPointViewModel: Identifiable {
	var id: Int { get { priority } }
	var priority: Int
	var title: String

	init(priority: Int, plotPoint: String) {
		self.priority = priority
		self.title = plotPoint
	}
}


class AdventureCrafterThemeViewModel: Identifiable {
	var id: String { get { title } }
	var title: String

	init(theme: String) {
		self.title = theme
	}
}
