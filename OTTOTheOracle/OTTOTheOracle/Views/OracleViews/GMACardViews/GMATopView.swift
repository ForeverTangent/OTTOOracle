//
//  GMATopView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMATopView: View {
	@ObservedObject var oracleViewModel: OracleViewModel
	@State private var showPopover: Bool = false

    var body: some View {
		HStack(alignment: .top) {
			VStack {
				Text("DIFFICULTY")
					.font(.system(size:10))
					.padding(.bottom, 5.0)
				Text("\(oracleViewModel.currentGMACardViewModel.difficulty)")
					.fontWeight(.bold)
			}
			VStack{
				Text("ODDS")
					.font(.system(size:10))
					.padding(.bottom, 5.0)
				HStack {
					Text("Bad")
						.font(.system(size:12))
					Spacer()
					Text("\(oracleViewModel.currentGMACardViewModel.likelyOddsBad)")
						.font(.system(size:14))
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
						.padding(.trailing)
				}
				.padding(.horizontal)
				HStack {
					Text("Even")
						.font(.system(size:12))
					Spacer()
					Text("\(oracleViewModel.currentGMACardViewModel.likelyOddsEven)")
						.font(.system(size:14))
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
						.padding(.trailing)
				}
				.padding(.horizontal)
				HStack {
					Text("Good")
						.font(.system(size:12))
					Spacer()
					Text("\(oracleViewModel.currentGMACardViewModel.likelyOddsGood)")
						.font(.system(size:14))
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
						.padding(.trailing)
				}
				.padding(.horizontal)
			}
			GMADiceView(diceSquareViewModel: DiceSquareViewModel())
				.frame(width: 100.0, height: 100.0)
			VStack{
				VStack {
					Text("RUNE")
						.font(.system(size:10))
						.padding(.bottom, 5.0)


					TextPopUpView(displayedText: oracleViewModel.currentGMACardViewModel.rune,
								  popUpText: oracleViewModel.currentGMACardViewModel.getDescriptionForRune())

				}
				.padding(.bottom)
				VStack {
					Text("ELEMENT")
						.font(.system(size:10))
						.padding(.bottom, 5.0)

					TextPopUpView(displayedText: oracleViewModel.currentGMACardViewModel.element,
								  popUpText: oracleViewModel.currentGMACardViewModel.getDescriptionForElement())

				}
			}
		}
		.frame(width: 360.0)
    }

	func getLikelyOdds(_ likelyOdds: GMACard_LikelyOdds) -> String {
		switch likelyOdds {
			case .NO_BANG:
				return "NO!"
			case .YES_BANG:
				return "YES!"
			case .NO:
				return "No."
			case .YES:
				return "Yes."
			case .NONE:
				return "NA"
		}

	}
}


struct GMATopView_Previews: PreviewProvider {
    static var previews: some View {
		return GMATopView(oracleViewModel: PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
