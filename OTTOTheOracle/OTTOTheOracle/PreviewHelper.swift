//
//  PreviewHelper.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/1/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class PreviewHelper {

	static func mockGMACardViewModel() -> GMACardViewModel {
		let mockedGMACardViewModel = GMACardViewModel()
		mockedGMACardViewModel.currentGMACard = mockGMACard()
		return mockedGMACardViewModel
	}

	static func mockGMACard() -> GMACard {
		return GMACard()
	}

	static func mockMYTHICCard() {

	}
}
