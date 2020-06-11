//
//  SoloRPGViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class SoloRPGViewModel: ObservableObject {
	var soloRPGOracleModel = SoloRPGOracleModel()

	@Published var answer: String = "ANSWER"
	@Published var twist: String = "None, None"

	func getSoloRPGAnswer() {

		let result = soloRPGOracleModel.getResults()

		answer = result.answer
		twist = "\(result.twist_subject), \(result.twist_verb)"

	}

}
