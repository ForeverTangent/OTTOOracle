//
//  CRGEOracleViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class CRGEOracleViewModel: ObservableObject {
	var crgeOracleModel = CRGEOracleModel()

	@Published var answer: String = "ANSWER"
	@Published var surge: Double = 0.0
	@Published var unexpectedly: String = ""
	@Published var unexpectedlyDescription: String = ""


	func getOracleResult(stage: CRGE_STAGE, surge: Int) {
		let results = crgeOracleModel.getOracleResultFor(stage: stage, withSurge: surge)

		answer = results.answer
		self.surge = Double(results.surge)
		unexpectedly = results.unexpected.rawValue
		unexpectedlyDescription = results.unexpectedDescription


	}

}
