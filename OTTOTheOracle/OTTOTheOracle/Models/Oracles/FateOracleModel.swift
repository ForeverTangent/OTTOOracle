//
//  FateOracleModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation


class FateOracleModel {
	
	static func getFateOracleResultForRank(_ rank: FATE_ORACLE_RANK) -> FateOracleResult {

		var answerTableResult: FateAnswerTableResult
		switch rank {
			case .TERRIBLE: answerTableResult = FATE_ORACLE_TERRIBLE_ANSWER_TABLE.randomWeightedElement()
			case .POOR: answerTableResult = FATE_ORACLE_POOR_ANSWER_TABLE.randomWeightedElement()
			case .EVEN: answerTableResult = FATE_ORACLE_EVEN_ANSWER_TABLE.randomWeightedElement()
			case .GOOD: answerTableResult = FATE_ORACLE_GOOD_ANSWER_TABLE.randomWeightedElement()
			case .GREAT: answerTableResult = FATE_ORACLE_GREAT_ANSWER_TABLE.randomWeightedElement()
			case .NONE: answerTableResult = FATE_ORACLE_EVEN_ANSWER_TABLE.randomWeightedElement()
		}
		
		return FateOracleResult(title: answerTableResult.title,
								oracleAnswer: answerTableResult.oracleAnswer,
								suprise: getSurprise(answerTableResult.surpriseFactor.rawValue))
		
	}
	
	static func getSurprise(_ surpriseFactor: Int) -> FATE_SURPRISE {
		let d4 = Die(maxPips: 4)
		let d4Result = d4.roll()
		print("surpriseFactor: \(abs(surpriseFactor)) + d4:\(d4Result)")
		let surprisedResult = abs(surpriseFactor) + d4Result
		return FATE_SURPRISE.getElementBy(value: surprisedResult)
	}
	
}

struct FateOracleResult {
	var title: FATE_ORACLE_ANSWER_TITLE
	var oracleAnswer: FATE_ORACLE_ANSWER
	var suprise: FATE_SURPRISE
}


struct FateAnswerTableResult {
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

enum FATE_ORACLE_ANSWER: Int, RPG_TABLE {
	typealias EnumerationType = FATE_ORACLE_ANSWER

	static var MIN: Int = -1
	static var MAX: Int = 1

	case NO = -1
	case EITHER = 0
	case YES = 1

	var descriptionShort: String {
		get {
			switch self {
				case .NO: return "No"
				case .EITHER: return "Either"
				case .YES: return "Yes"
			}
		}
	}
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> FATE_ORACLE_ANSWER {
		switch value {
			case -1: return .NO
			case 0: return .EITHER
			case 1: return .YES
			default: return .EITHER
		}
	}
}

enum FATE_SURPRISE_FACTOR: Int, RPG_TABLE {
	typealias EnumerationType = FATE_SURPRISE_FACTOR

	static var MIN: Int = -2
	static var MAX: Int = 2

	case MINUS_2 = -2
	case MINUS_1 = -1
	case NONE = 0
	case PLUS_1 = 1
	case PLUS_2 = 2

	var descriptionShort: String {
		get {
			switch self {
				case .MINUS_2: return "--"
				case .MINUS_1: return "-"
				case .NONE: return ""
				case .PLUS_1: return "+"
				case .PLUS_2: return "++"
			}
		}
	}
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> FATE_SURPRISE_FACTOR {
		switch value {
			case -2: return .MINUS_2
			case -1: return .MINUS_1
			case 0: return .NONE
			case 1: return .PLUS_1
			case 2: return .PLUS_2
			default: return .NONE
		}
	}
}

enum FATE_SURPRISE: String, RPG_TABLE {
	static var MIN: Int = 0
	static var MAX: Int = 6

	case MINOR
	case MODERATE
	case MAJOR
	case NONE

	var descriptionShort: String {
		get {
			return rawValue.capitalized
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

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
		return getElementBy(value: abs(supriseFactor.rawValue) + fateDiceResult)
	}
}


/**
This Enum is Int based so we can use it with a slider
*/
enum FATE_ORACLE_RANK: Int, RPG_TABLE {
	typealias EnumerationType = FATE_ORACLE_RANK

	static var MIN: Int = 1
	static var MAX: Int = 5

	case NONE = 0
	case TERRIBLE = 1
	case POOR = 2
	case EVEN = 3
	case GOOD = 4
	case GREAT = 5

	var descriptionShort: String {
		get {
			switch self {
				case .TERRIBLE: return "Terrible"
				case .POOR: return "Poor"
				case .EVEN: return "Even"
				case .GOOD: return "Good"
				case .GREAT: return "Great"
				default: return "None"
			}
		}
	}
	var descriptionLong: String { get { return descriptionShort } }

	static func getElementBy(value: Int) -> FATE_ORACLE_RANK {
		switch value {
			case 1: return .TERRIBLE
			case 2: return .POOR
			case 3: return .EVEN
			case 4: return .GOOD
			case 5: return .GREAT
			default: return .NONE
		}
	}

}

/**
This Enum is Int based so we can use it with a slider
*/
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

	var descriptionShort: String {
		get {
			switch self {
				case .NO_MINUS_MINUS_2: return FATE_ORACLE_ANSWER_TITLE.NO_MINUS_MINUS.rawValue
				case .NO_MINUS_MINUS_1: return FATE_ORACLE_ANSWER_TITLE.NO_MINUS_MINUS.rawValue
				case .NO_MINUS: return FATE_ORACLE_ANSWER_TITLE.NO_MINUS.rawValue
				case .NO_2: return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .NO_1: return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .NO_PLUS: return FATE_ORACLE_ANSWER_TITLE.NO_PlUS.rawValue
				case .EITHER: return FATE_ORACLE_ANSWER_TITLE.EITHER.rawValue
				case .YES_MINUS: return FATE_ORACLE_ANSWER_TITLE.YES_MINUS.rawValue
				case .YES: return FATE_ORACLE_ANSWER_TITLE.YES.rawValue
			}
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> FateAnswerTableResult {
		switch value {
			case -4:
				return FateAnswerTableResult(title: .NO_MINUS_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_2)
			case -3:
				return FateAnswerTableResult(title: .NO_MINUS_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_2)
			case -2:
				return FateAnswerTableResult(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -1:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case 0:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case 1:
				return FateAnswerTableResult(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case 2:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 3:
				return FateAnswerTableResult(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 4:
				return FateAnswerTableResult(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			default:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
		}
	}

}

/**
This Enum is Int based so we can use it with a slider
*/
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

	var descriptionShort: String {
		get {
			switch self {
				case .NO_MINUS_MINUS_1:
					return FATE_ORACLE_ANSWER_TITLE.NO_MINUS_MINUS.rawValue
				case .NO_MINUS_2:
					return FATE_ORACLE_ANSWER_TITLE.NO_MINUS.rawValue
				case .NO_MINUS_1:
					return FATE_ORACLE_ANSWER_TITLE.NO_MINUS.rawValue
				case .NO:
					return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .NO_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .EITHER:
					return FATE_ORACLE_ANSWER_TITLE.EITHER.rawValue
				case .YES_MINUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_MINUS.rawValue
				case .YES:
					return FATE_ORACLE_ANSWER_TITLE.YES.rawValue
				case .YES_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS.rawValue
			}
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> FateAnswerTableResult {
		switch value {
			case -4:
				return FateAnswerTableResult(title: .NO_MINUS_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_2)
			case -3:
				return FateAnswerTableResult(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -2:
				return FateAnswerTableResult(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -1:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case 0:
				return FateAnswerTableResult(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case 1:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 2:
				return FateAnswerTableResult(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 3:
				return FateAnswerTableResult(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 4:
				return FateAnswerTableResult(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			default:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
		}
	}

}

/**
This Enum is Int based so we can use it with a slider
*/
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

	var descriptionShort: String {
		get {
			switch self {
				case .NO_MINUS_2:
					return FATE_ORACLE_ANSWER_TITLE.NO_MINUS.rawValue
				case .NO_MINUS_1:
					return FATE_ORACLE_ANSWER_TITLE.NO_MINUS.rawValue
				case .NO:
					return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .NO_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.NO_PlUS.rawValue
				case .EITHER:
					return FATE_ORACLE_ANSWER_TITLE.EITHER.rawValue
				case .YES_MINUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_MINUS.rawValue
				case .YES:
					return FATE_ORACLE_ANSWER_TITLE.YES.rawValue
				case .YES_PLUS_1:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS.rawValue
				case .YES_PLUS_2:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS.rawValue
			}
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> FateAnswerTableResult {
		switch value {
			case -4:
				return FateAnswerTableResult(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -3:
				return FateAnswerTableResult(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -2:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case -1:
				return FateAnswerTableResult(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case 0:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 1:
				return FateAnswerTableResult(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 2:
				return FateAnswerTableResult(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 3:
				return FateAnswerTableResult(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 4:
				return FateAnswerTableResult(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			default:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
		}
	}

}

/**
This Enum is Int based so we can use it with a slider
*/
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

	var descriptionShort: String {
		get {
			switch self {
				case .NO_MINUS:
					return FATE_ORACLE_ANSWER_TITLE.NO_MINUS.rawValue
				case .NO:
					return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .NO_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.NO_PlUS.rawValue
				case .EITHER:
					return FATE_ORACLE_ANSWER_TITLE.EITHER.rawValue
				case .YES_MINUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_MINUS.rawValue
				case .YES:
					return FATE_ORACLE_ANSWER_TITLE.YES.rawValue
				case .YES_PLUS_1:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS.rawValue
				case .YES_PLUS_2:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS.rawValue
				case .YES_PLUS_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS_PLUS.rawValue
			}
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> FateAnswerTableResult {
		switch value {
			case -4:
				return FateAnswerTableResult(title: .NO_MINUS, oracleAnswer: .NO, surpriseFactor: .MINUS_1)
			case -3:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case -2:
				return FateAnswerTableResult(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case -1:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case 0:
				return FateAnswerTableResult(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 1:
				return FateAnswerTableResult(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 2:
				return FateAnswerTableResult(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 3:
				return FateAnswerTableResult(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 4:
				return FateAnswerTableResult(title: .YES_PLUS_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_2)
			default:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
		}
	}

}


/**
This Enum is Int based so we can use it with a slider
*/
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

	var descriptionShort: String {
		get {
			switch self {
				case .NO:
					return FATE_ORACLE_ANSWER_TITLE.NO.rawValue
				case .NO_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.NO_PlUS.rawValue
				case .EITHER:
					return FATE_ORACLE_ANSWER_TITLE.EITHER.rawValue
				case .YES_MINUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_MINUS.rawValue
				case .YES_1:
					return FATE_ORACLE_ANSWER_TITLE.YES.rawValue
				case .YES_2:
					return FATE_ORACLE_ANSWER_TITLE.YES.rawValue
				case .YES_PLUS:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS.rawValue
				case .YES_PLUS_PLUS_1:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS_PLUS.rawValue
				case .YES_PLUS_PLUS_2:
					return FATE_ORACLE_ANSWER_TITLE.YES_PLUS_PLUS.rawValue
			}
		}
	}

	var descriptionLong: String {
		get {
			return descriptionShort
		}
	}

	static func getElementBy(value: Int) -> FateAnswerTableResult {
		switch value {
			case -4:
				return FateAnswerTableResult(title: .NO, oracleAnswer: .NO, surpriseFactor: .NONE)
			case -3:
				return FateAnswerTableResult(title: .NO_PlUS, oracleAnswer: .NO, surpriseFactor: .PLUS_1)
			case -2:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
			case -1:
				return FateAnswerTableResult(title: .YES_MINUS, oracleAnswer: .YES, surpriseFactor: .MINUS_1)
			case 0:
				return FateAnswerTableResult(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 1:
				return FateAnswerTableResult(title: .YES, oracleAnswer: .YES, surpriseFactor: .NONE)
			case 2:
				return FateAnswerTableResult(title: .YES_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_1)
			case 3:
				return FateAnswerTableResult(title: .YES_PLUS_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_2)
			case 4:
				return FateAnswerTableResult(title: .YES_PLUS_PLUS, oracleAnswer: .YES, surpriseFactor: .PLUS_2)
			default:
				return FateAnswerTableResult(title: .EITHER, oracleAnswer: .EITHER, surpriseFactor: .NONE)
		}
	}

}
