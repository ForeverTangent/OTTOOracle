//
//  RandomDiceViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation
import os

class DiceSquareViewModel: ObservableObject {

	private static let subsystem = Bundle.main.bundleIdentifier!
	private static let catagory = "DiceSquareViewModel"
	static let poiLogger = OSLog(subsystem: subsystem, category: .pointsOfInterest)
	private let logger = OSLog(subsystem: subsystem, category: catagory)


	private var d4Die = Die(maxPips: 4)
	private var d6Die = Die(maxPips: 6)
	private var d8Die = Die(maxPips: 8)
	private var d10Die = Die(maxPips: 10)
	private var d12Die = Die(maxPips: 12)
	private var d20Die = Die(maxPips: 20)
	private var d10TensDie = Die(maxPips: 10)
	private var d10OnesDie = Die(maxPips: 10)
	private var fateDice = FateDice()

	@Published var d4: String = "#"
	@Published var d6: String = "#"
	@Published var d8: String = "#"
	@Published var d10: String = "#"
	@Published var d12: String = "#"
	@Published var d20: String = "#"
	@Published var d10Tens: String = "#"
	@Published var d10Ones: String = "#"
	@Published var fateResult: String = "#"


	init() {
		getNewRolls()
	}

	func getNewRolls() {
		os_log(.default, log: logger, "Rolling new dice sqaure.")
		d4 = "\(d4Die.roll())"
		d6 = "\(d6Die.roll())"
		d8 = "\(d8Die.roll())"
		d10 = "\(d10Die.roll())"
		d12 = "\(d12Die.roll())"
		d20 = "\(d20Die.roll())"
		d10Tens = getD10Tens()
		d10Ones = getD10Ones()
		fateResult = "\(fateDice.roll())"

	}

	private func getD10Tens() -> String {
		let result = d10Die.roll()
		if result == 10 { return "00" }
		return "\(result)0"
	}

	private func getD10Ones() -> String {
		let result = d10Die.roll()
		if result == 10 { return "0" }
		return "\(result)"
	}

}
