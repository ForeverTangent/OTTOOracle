//
//  FateOracleViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class FateOracleViewModel: ObservableObject {

	@Published var answer: String = "ANSWER"
	@Published var surprise: String = "SURPRISE"

	func getFateOracleAnswerWithRank(_ rank: FATE_ORACLE_RANK) {
		let results = FateOracleModel.getFateOracleResultForRank(rank)

		switch results.oracleAnswer {
			case .YES: answer = "YES"
			case .NO: answer = "NO"
			case .EITHER: answer = "EITHER"
		}

		surprise = results.suprise.rawValue
	}


}
