//
//  Base.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/30/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

/**
This File contains all the base structues for Otto.
*/

/**
A basic dice class.
*/
class Die {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "Die"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	internal var minPips: Int = 1
	private var maxPips: Int

	// MARK: - Init

	init(maxPips: Int) {
		os_log(.default, log: logger, "Creating Die with %d pips.", maxPips)
		self.maxPips = maxPips
	}

	// MARK: Class Methods

	func roll() -> Int {
		os_log(.default, log: logger, "Rolling %d Die", maxPips)
		var SRNG = SystemRandomNumberGenerator()
		return Int.random(in: minPips...maxPips, using: &SRNG)
	}
}


/**
Basic FateDice
*/
class FateDie: Die {

	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "FateDie"
	private let logger = OSLog(subsystem: subsystem, category: catagory)

	// MARK: - Init

	init() {
		os_log(.default, log: logger, "Creating Fate Die")
		super.init(maxPips: 1)
		self.minPips = -1
	}
}

class Card {
	// MARK: - Properties

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "FateDie"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)

}

/**
Generic class for holding a deck of cards.
*/
class Deck<T: Comparable> {

	// MARK: - Properties

	private let subsystem = Bundle.main.bundleIdentifier!
	private let catagory = "Deck of \(type(of: T.self))"
	private let poiLogger = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "Deck of \(type(of: T.self))")

	var cards: [T] = [T]()

	// MARK: - Init

	init(_ cards: [T]) {
		let typeString = "\(T.self)"
		os_log(.default, log: logger, "Creating Deck of %s", typeString)
		self.cards = cards
	}

	// MARK: - Class Methods

	/**
	Draws X number of cards, after shuffling the deck Y times.

	- Parameter number: Int (number of card drawn, default = 1)
	- Parameter shuffled: Int (times deck is shuffled before draw, default = 7)
	- Returns: T
	*/
	func draw(number: Int = 1, fromTimesShuffled shuffled: Int = 7) -> [T] {
		let typeString = "\(T.self)"
		os_log(.default, log: logger, "Drawing card of Deck of %s", typeString)
		var SRNG = SystemRandomNumberGenerator()
		for _ in 0...shuffled {
			cards = cards.shuffled(using: &SRNG)
		}
		let drawnCards = cards[0...number]
		return Array(drawnCards)
	}


	/**
	Sorts the deck.
	*/
	func sortDeck() {
		cards.sort()
	}

}


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
	static func randomWeightedElement() -> Result?
}

/**
Extention fro RPG_TABLE Protocol.
*/
extension RPG_TABLE {
	static var MIN: Int {
		get {
			return 0
		}
	}
	static var MAX: Int {
		get {
			return 99
		}
	}

	static func randomIntInRange() -> Int {
		var SRNG = SystemRandomNumberGenerator()
		return Int.random(in: MIN...MAX, using: &SRNG)
	}

	static func randomElement() -> Self {
		var SRNG = SystemRandomNumberGenerator()
		return Self.allCases.randomElement(using: &SRNG)!
	}

	static func randomWeightedElement() -> Result? {
		let index = randomIntInRange()
		return getElementBy(value: index)
	}

}
