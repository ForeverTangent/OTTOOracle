//
//  RandomDiceViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class JustDiceViewModel: ObservableObject {

	var d4Die = Die(maxPips: 4)
	var d6Die = Die(maxPips: 6)
	var d8Die = Die(maxPips: 8)
	var d10Die = Die(maxPips: 10)
	var d12Die = Die(maxPips: 12)
	var d20Die = Die(maxPips: 20)
	var d10TensDie = Die(maxPips: 10)
	var d10OnesDie = Die(maxPips: 10)
	var fate = FateDice()

	var d4: String { get { return "*" } }
	var d6: String { get { return "*" } }
	var d8: String { get { return "*" } }
	var d10: String { get { return "*" } }
	var d12: String { get { return "*" } }
	var d20: String { get { return "*" } }
	var d10Tens: String { get { return "*" } }
	var d10Ones: String { get { return "*" } }

	var fateResult: String = "\(FateDice().roll())"

	lazy var d10TensResult: String = getD10Tens()
	lazy var d10OneResult: String = getD10Ones()

	func getNewRollAll() {
		fateResult = "\(FateDice().roll())"
		d10TensResult = getD10Tens()
		d10OneResult = "\(d10Die.roll())"
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
