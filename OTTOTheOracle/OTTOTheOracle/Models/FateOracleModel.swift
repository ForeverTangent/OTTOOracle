//
//  FateOracleAnswerResult.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/5/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

struct FateOracleModel {
	var title: FATE_ORACLE_ANSWER_TITLE
	var oracleAnswer: FATE_ORACLE_ANSWER
	var surpriseFactor: FATE_SURPRISE_FACTOR
}


enum FATE_ORACLE_ANSWER_TITLE: String, CaseIterable {
	case NO_MINUS_MINUS = "No--"
	case NO_MINUS = "No-"
	case NO = "No"
	case NO_PlUS = "No+"
	case EITHER = "No++/Yes--"
	case YES_MINUS = "Yes-"
	case YES = "Yes"
	case YES_PLUS = "Yes+"
	case YES_PLUS_PLUS = "Yes++"
}

enum FATE_ORACLE_ANSWER: Int, CaseIterable {
	case NO = -1
	case EITHER = 0
	case YES = 1
}


enum FATE_SURPRISE_FACTOR: Int, CaseIterable {
	case MINUS_2 = -2
	case MINUS_1 = -1
	case NONE = 0
	case PLUS_1 = 1
	case PLUS_2 = 2

}

enum FATE_SURPRISE: String, RPG_TABLE {

	static var MIN: Int = 0
	static var MAX: Int = 6

	case MINOR = "Minor"
	case MODERATE = "Moderate"
	case MAJOR = "Major"
	case NONE = "None"

	static func getElementBy(value: Int) -> FATE_SURPRISE {
		switch value {
			case 3...4:
				return MINOR
			case 5:
				return MODERATE
			case 6:
				return MAJOR
			default:
				return NONE
		}
	}

	static func getResult(supriseFactor: FATE_SURPRISE_FACTOR, fateDiceResult: Int) -> FATE_SURPRISE {
		return getElementBy(value: supriseFactor.rawValue + fateDiceResult)
	}

}

enum FATE_ORACLE_TERRIBLE_ANSWER_TABLE: Int, RPG_TABLE {

	static var MIN: Int = -4
	static var MAX: Int = 4

	case NO_MINUS_MINUS_2 = -4
	case NO_MINUS_MINUS_1 = -3
	case NO_MINUS = -2
	case NO_2 = -1
	case NO_1 = 0
	case NO_PLUS = 1
	case EITHER = 2
	case YES_MINUS = 3
	case YES = 4


	static func getElementBy(value: Int) -> FateOracleModel {
		switch value {
			case -4:
				return FateOracleModel(title: .NO_MINUS_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_2)
			case -3:
				return FateOracleModel(title: .NO_MINUS_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_2)
			case -2:
				return FateOracleModel(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -1:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case 0:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case 1:
				return FateOracleModel(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case 2:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 3:
				return FateOracleModel(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 4:
				return FateOracleModel(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			default:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
		}
	}

}


enum FATE_ORACLE_POOR_ANSWER_TABLE: Int, RPG_TABLE {

	static var MIN: Int = -4
	static var MAX: Int = 4

	case NO_MINUS_MINUS_1 = -4
	case NO_MINUS_2 = -3
	case NO_MINUS_1 = -2
	case NO = -1
	case NO_PLUS = 0
	case EITHER = 1
	case YES_MINUS = 2
	case YES = 3
	case YES_PLUS = 4

	static func getElementBy(value: Int) -> FateOracleModel {
		switch value {
			case -4:
				return FateOracleModel(title: .NO_MINUS_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_2)
			case -3:
				return FateOracleModel(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -2:
				return FateOracleModel(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -1:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case 0:
				return FateOracleModel(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case 1:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 2:
				return FateOracleModel(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 3:
				return FateOracleModel(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 4:
				return FateOracleModel(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			default:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
		}
	}

}



enum FATE_ORACLE_EVEN_ANSWER_TABLE: Int, RPG_TABLE {

	static var MIN: Int = -4
	static var MAX: Int = 4

	case NO_MINUS_2 = -4
	case NO_MINUS_1 = -3
	case NO = -2
	case NO_PLUS = -1
	case EITHER = 0
	case YES_MINUS = 1
	case YES = 2
	case YES_PLUS_1 = 3
	case YES_PLUS_2 = 4

	static func getElementBy(value: Int) -> FateOracleModel {
		switch value {
			case -4:
				return FateOracleModel(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -3:
				return FateOracleModel(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -2:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case -1:
				return FateOracleModel(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case 0:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 1:
				return FateOracleModel(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 2:
				return FateOracleModel(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 3:
				return FateOracleModel(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 4:
				return FateOracleModel(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			default:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
		}
	}

}

enum FATE_ORACLE_GOOD_ANSWER_TABLE: Int, RPG_TABLE {

	static var MIN: Int = -4
	static var MAX: Int = 4

	case NO_MINUS = -4
	case NO = -3
	case NO_PLUS = -2
	case EITHER = -1
	case YES_MINUS = 0
	case YES = 1
	case YES_PLUS_1 = 2
	case YES_PLUS_2 = 3
	case YES_PLUS_PLUS = 4

	static func getElementBy(value: Int) -> FateOracleModel {
		switch value {
			case -4:
				return FateOracleModel(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -3:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case -2:
				return FateOracleModel(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case -1:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 0:
				return FateOracleModel(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 1:
				return FateOracleModel(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 2:
				return FateOracleModel(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 3:
				return FateOracleModel(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 4:
				return FateOracleModel(title: .YES_PLUS_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_2)
			default:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
		}
	}

}


enum FATE_ORACLE_GREAT_ANSWER_TABLE: Int, RPG_TABLE {

	static var MIN: Int = -4
	static var MAX: Int = 4

	case NO = -4
	case NO_PLUS = -3
	case EITHER = -2
	case YES_MINUS = -1
	case YES_1 = 0
	case YES_2 = 1
	case YES_PLUS = 2
	case YES_PLUS_PLUS_1 = 3
	case YES_PLUS_PLUS_2 = 4

	static func getElementBy(value: Int) -> FateOracleModel {
		switch value {
			case -4:
				return FateOracleModel(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case -3:
				return FateOracleModel(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case -2:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case -1:
				return FateOracleModel(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 0:
				return FateOracleModel(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 1:
				return FateOracleModel(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 2:
				return FateOracleModel(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 3:
				return FateOracleModel(title: .YES_PLUS_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_2)
			case 4:
				return FateOracleModel(title: .YES_PLUS_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_2)
			default:
				return FateOracleModel(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
		}
	}

}
