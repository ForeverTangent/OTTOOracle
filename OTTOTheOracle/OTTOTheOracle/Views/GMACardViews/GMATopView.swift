//
//  GMATopView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMATopView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	@State private var overText = false


    var body: some View {
		HStack(alignment: .top) {
			VStack {
				Text("DIFFICULTY")
					.font(.system(size:10))
					.padding(.bottom, 5.0)
				Text("\(oracleViewModel.currentGMACardViewModel.difficulty)")
					.font(.system(size:16))
					.fontWeight(.bold)

			}
			.padding(.leading)
			Spacer()
			VStack{
				Text("ODDS")
					.font(.system(size:10))
					.padding(.bottom, 5.0)
				HStack {
					Text("Bad")
						.font(.system(size:12))
						.padding(.leading)
					Spacer()
					Text("\(oracleViewModel.currentGMACardViewModel.likelyOddsBad)")
						.font(.system(size:14))
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.padding(.trailing)
				}
				HStack {
					Text("Even")
						.font(.system(size:12))
						.padding(.leading)
					Spacer()
					Text("\(oracleViewModel.currentGMACardViewModel.likelyOddsEven)")
						.font(.system(size:14))
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.padding(.trailing)
				}
				HStack {
					Text("Good")
						.font(.system(size:12))
						.padding(.leading)
					Spacer()
					Text("\(oracleViewModel.currentGMACardViewModel.likelyOddsGood)")
						.font(.system(size:14))
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.padding(.trailing)
				}
			}
			Spacer()
			GMADiceView()
				.frame(width: 100.0, height: 100.0)
			Spacer()
			VStack{
				VStack {
					Text("RUNE")
						.font(.system(size:10))
						.padding(.bottom, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.rune)")
						.font(.system(size:16))
						.fontWeight(.bold)
				}
				.padding(.bottom)
				VStack {
					Text("ELEMENT")
						.font(.system(size:10))
						.padding(.bottom, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.element)")
						.font(.system(size:16))
						.fontWeight(.bold)
				}
			}
			.padding(.trailing)
		}
		.frame(width: 360.0)
    }

	func getLikelyOdds(_ likelyOdds: GMACard_LikelyOdds) -> String {
		switch likelyOdds {
			case .noBang:
				return "NO!"
			case .yesBang:
				return "YES!"
			case .no:
				return "No."
			case .yes:
				return "Yes."
			case .NONE:
				return "NA"
		}

	}

}

struct GMATopView_Previews: PreviewProvider {
    static var previews: some View {
		return GMATopView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
