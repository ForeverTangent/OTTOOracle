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

	static func mockOracleWithDeckAndDrawnCard() -> OracleViewModel {
		let oracleViewModel = OracleViewModel()
		oracleViewModel.drawGMACard()
		oracleViewModel.drawMythicCard()
		return oracleViewModel
	}

	static func mockOracleWithSortedDeckUseCardIndex(_ index: Int = 0) -> OracleViewModel {
		let oracleViewModel = OracleViewModel()
		oracleViewModel.drawGMACardIndex(index)
		oracleViewModel.drawMythicCardIndex(index, forward: true)
		return oracleViewModel
	}

	static func mockGMACard() -> GMACard {
		return GMACard()
	}

	static func mockMYTHICCard() {

	}
}
