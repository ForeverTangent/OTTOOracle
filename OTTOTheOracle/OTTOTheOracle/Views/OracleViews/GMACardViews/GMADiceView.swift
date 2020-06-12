//
//  GMADiceView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/30/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMADiceView: View {
	@ObservedObject var diceSquareViewModel = DiceSquareViewModel()

	var body: some View {
		HStack(alignment: .center) {
			VStack(alignment: .center) {
				VStack {
					Text("D4")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d4)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Four"))
						.accessibility(value: Text("\(diceSquareViewModel.d4)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("D10")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d10)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Ten"))
						.accessibility(value: Text("\(diceSquareViewModel.d10)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("D20")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d20)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Twenty"))
						.accessibility(value: Text("\(diceSquareViewModel.d20)"))
				}
				.frame(width: 30.0, height: 30.0)
			}
			VStack(alignment: .center) {
				VStack {
					Text("D6")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d6)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Six"))
						.accessibility(value: Text("\(diceSquareViewModel.d6)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("F")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.fateResult)")
						.fontWeight(.regular)
						.accessibility(label: Text("Fate Dice"))
						.accessibility(value: Text("\(diceSquareViewModel.fateResult)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("10s")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d10Tens)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Ten Tens"))
						.accessibility(value: Text("\(diceSquareViewModel.d10Tens)"))
				}
				.frame(width: 30.0, height: 30.0)
			}
			VStack(alignment: .center) {
				VStack {
					Text("D8")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d8)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Eight"))
						.accessibility(value: Text("\(diceSquareViewModel.d8)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("D12")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d12)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Twelve"))
						.accessibility(value: Text("\(diceSquareViewModel.d12)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("1s")
						.font(.system(size:10))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(diceSquareViewModel.d10Ones)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Ten Ones"))
						.accessibility(value: Text("\(diceSquareViewModel.d10Ones)"))
				}
				.frame(width: 30.0, height: 30.0)
			}
		}
		.frame(width: 100.0, height: 100.0)
	}
}

struct GMADiceView_Previews: PreviewProvider {
	static var previews: some View {
		return GMADiceView(diceSquareViewModel: DiceSquareViewModel())
	}

}
