//
//  CypherOracleViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class CypherOracleViewModel: ObservableObject {
	var cypherOracleModel = CypherOracleModel()

	@Published var answer: String = "ANSWER"
	@Published var developer: String = "DEVELOPER"

	public func getOracleResult(adventureStatus: CYPHER_ADVENTURE_STATUS, gmConsult: CYPHER_GM_CONSULT) {

		let result = cypherOracleModel.getOracleResultFor(adventureStatus: adventureStatus, gmConsult: gmConsult)

		answer = result.oracleAnswer.rawValue
		developer = result.developer.rawValue

	}

}
