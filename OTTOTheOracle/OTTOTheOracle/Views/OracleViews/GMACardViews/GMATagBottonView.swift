//
//  GMATagBottonView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMATagBottonView: View {
	@ObservedObject var oracleViewModel: OracleViewModel

    var body: some View {
		VStack {
			HStack {
				Spacer()
				TextPopUpView(displayedText: oracleViewModel.currentGMACardViewModel.tagSymbol1,
							  popUpText: oracleViewModel.currentGMACardViewModel.getDescriptionForTag1())
				Spacer()
				TextPopUpView(displayedText: oracleViewModel.currentGMACardViewModel.tagSymbol2,
							  popUpText: oracleViewModel.currentGMACardViewModel.getDescriptionForTag2())
				Spacer()
				TextPopUpView(displayedText: oracleViewModel.currentGMACardViewModel.tagSymbol3,
							  popUpText: oracleViewModel.currentGMACardViewModel.getDescriptionForTag3())
				Spacer()
				Text("\(oracleViewModel.currentGMACardViewModel.scatterSymbol)")
					.font(.system(size:20))
					.fontWeight(.bold)
					.frame(width: 50.0)
				Spacer()
			}
			.padding()
			.frame(height: 30.0)
			HStack() {
				Spacer()
				VStack(alignment: .center){
					Text("BELONGINGS")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.belongings)")
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
						.frame(width: 150.0)
					Text("CATALYST")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.catalyst)")
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
						.frame(width: 150.0)
					Text("LOCATION")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.location)")
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
						.frame(width: 150.0)
				}
				.padding()
				Spacer()
				VStack(alignment: .center){
					Text("NAMES")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.name1)")
						.fontWeight(.bold)
					Text("\(oracleViewModel.currentGMACardViewModel.name2)")
						.fontWeight(.bold)
					Text("\(oracleViewModel.currentGMACardViewModel.name3)")
						.fontWeight(.bold)
					Text("VIRTUE")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.virtue)")
						.fontWeight(.bold)
					Text("VICE")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleViewModel.currentGMACardViewModel.vice)")
						.fontWeight(.bold)
				}
				.padding()
				Spacer()
			}
			.padding(10.0)
			.frame(height: 200.0)

		}
		.padding(.vertical, 5.0)
		.frame(width: 360.0)
    }
}

struct GMATagBottonView_Previews: PreviewProvider {
    static var previews: some View {
		return GMATagBottonView(oracleViewModel: PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
