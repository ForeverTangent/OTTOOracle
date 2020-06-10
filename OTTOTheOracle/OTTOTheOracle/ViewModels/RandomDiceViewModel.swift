//
//  RandomDiceViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class RandomDiceViewModel: ObservableObject {

	var d4 = Die(maxPips: 4)
	var d6 = Die(maxPips: 6)
	var d8 = Die(maxPips: 8)
	var d10 = Die(maxPips: 10)
	var d12 = Die(maxPips: 12)
	var d20 = Die(maxPips: 20)
	var fate = FateDice()

//	@Published var d4Result: String = "\(Die(maxPips: 4).roll())"
//	@Published var d6Result: String = "\(Die(maxPips: 6).roll())"
//	@Published var d8Result: String = "\(Die(maxPips: 8).roll())"
//	@Published var d10Result: String = "\(Die(maxPips: 10).roll())"
//	@Published var d12Result: String = "\(Die(maxPips: 12).roll())"
//	@Published var d20Result: String = "\(Die(maxPips: 20).roll())"
//
//	@Published var fateResult: String = "\(FateDice().roll())"
//
//	@Published var d10TensResult: String = "\(00))"
//	@Published var d10OneResult: String = "\(0))"


	var d4Result: String = "\(Die(maxPips: 4).roll())"
	var d6Result: String = "\(Die(maxPips: 6).roll())"
	var d8Result: String = "\(Die(maxPips: 8).roll())"
	var d10Result: String = "\(Die(maxPips: 10).roll())"
	var d12Result: String = "\(Die(maxPips: 12).roll())"
	var d20Result: String = "\(Die(maxPips: 20).roll())"

	var fateResult: String = "\(FateDice().roll())"

	lazy var d10TensResult: String = getD10Tens()
	lazy var d10OneResult: String = getD10Ones()

	func getNewRollAll() {
		d4Result = "\(d4.roll())"
		d6Result = "\(d6.roll())"
		d8Result = "\(d8.roll())"
		d10Result = "\(d10.roll())"
		d12Result = "\(d12.roll())"
		d20Result = "\(d20.roll())"
		fateResult = "\(FateDice().roll())"
		d10TensResult = getD10Tens()
		d10OneResult = "\(d10.roll())"
	}

	private func getD10Tens() -> String {
		let result = d10.roll()
		if result == 10 { return "00" }
		return "\(result)0"
	}

	private func getD10Ones() -> String {
		let result = d10.roll()
		if result == 10 { return "0" }
		return "\(result)"
	}

}
