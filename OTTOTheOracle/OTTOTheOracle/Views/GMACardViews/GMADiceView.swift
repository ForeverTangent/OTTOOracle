//
//  GMADiceView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/30/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMADiceView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	
	var body: some View {
		HStack(alignment: .center) {
			VStack(alignment: .center) {
				VStack {
					Text("D4")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d4)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Four"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d4)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("D10")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d10)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Ten"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d10)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("D20")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d20)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Twenty"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d20)"))
				}
				.frame(width: 30.0, height: 30.0)
			}
			VStack(alignment: .center) {
				VStack {
					Text("D6")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d6)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Six"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d6)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("F")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.fateDiceRoll)")
						.fontWeight(.regular)
						.accessibility(label: Text("Fate Dice"))
						.accessibility(value: Text("\(oracleViewModel.fateDiceRoll)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("10s")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d10Tens)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Ten Tens"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d10Tens)"))
				}
				.frame(width: 30.0, height: 30.0)
			}
			VStack(alignment: .center) {
				VStack {
					Text("D8")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d8)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Eight"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d8)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("D12")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d12)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Twelve"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d12)"))
				}
				.frame(width: 30.0, height: 30.0)
				VStack {
					Text("1s")
						.font(.system(size:12))
						.fontWeight(.thin)
						.accessibility(hidden: true)
					Text("\(oracleViewModel.currentGMACardViewModel.d10Ones)")
						.fontWeight(.regular)
						.accessibility(label: Text("D Ten Ones"))
						.accessibility(value: Text("\(oracleViewModel.currentGMACardViewModel.d10Ones)"))
				}
				.frame(width: 30.0, height: 30.0)
			}
		}
		.frame(width: 100.0, height: 100.0)
	}
}

struct GMADiceView_Previews: PreviewProvider {
	static var previews: some View {
		return GMADiceView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
	}

}
