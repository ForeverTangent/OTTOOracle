//
//  Deck.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

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
