//
//  PreviewHelper.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/1/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class PreviewHelper {

	static func mockOracle() -> OracleViewModel {
		return OracleViewModel()
	}

	static func mockRollDiceSquare() -> OracleViewModel {
		let oracleViewModel = OracleViewModel()
		oracleViewModel.diceSquareViewModel.getNewRolls()
		return oracleViewModel
	}


	static func mockOracleWithDeckAndDrawnCard() -> OracleViewModel {
		let oracleViewModel = OracleViewModel()
		oracleViewModel.drawGMACard()
		oracleViewModel.drawMythicCard()
		return oracleViewModel
	}

	static func mockOracleWithSortedDeckUseCardIndex(_ index: Int = 0) -> OracleViewModel {
		let oracleViewModel = OracleViewModel()
		oracleViewModel.drawGMACardAtIndex(index)
		oracleViewModel.drawMythicCardIndex(index, forward: true)
		return oracleViewModel
	}

	static func mockGMACard() -> GMACard {
		return GMACard()
	}

	static func mockMYTHICCard() {

	}
}
