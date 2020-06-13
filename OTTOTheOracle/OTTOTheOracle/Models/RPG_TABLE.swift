//
//  RPG_TABLE.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

/**
Protocol for building RPG_TABLEs
*/
protocol RPG_TABLE: CaseIterable {
	associatedtype Result
	static var MIN: Int { get }
	static var MAX: Int { get }
	static func getElementBy(value: Int) -> Result
	static func randomElement() -> Self
	static func randomIntInRange() -> Int
	static func randomWeightedElement() -> Result
}

/**
Extention fro RPG_TABLE Protocol.
*/
extension RPG_TABLE {
	
	static func randomIntInRange() -> Int {
		var SRNG = SystemRandomNumberGenerator()
		return Int.random(in: MIN...MAX, using: &SRNG)
	}

	static func randomElement() -> Self {
		var SRNG = SystemRandomNumberGenerator()
		return Self.allCases.randomElement(using: &SRNG)!
	}

	static func randomWeightedElement() -> Result {
		let index = randomIntInRange()
		return getElementBy(value: index)
	}

}
