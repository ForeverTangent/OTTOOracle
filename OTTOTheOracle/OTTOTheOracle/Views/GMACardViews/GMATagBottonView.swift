//
//  GMATagBottonView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMATagBottonView: View {
	@EnvironmentObject var oracleManager: OracleViewModel

    var body: some View {
		VStack {
			HStack {
				Spacer()
				Text("\(oracleManager.currentGMACardViewModel.tagSymbol1)")
					.font(.system(size:20))
					.fontWeight(.bold)
					.frame(width: 50.0)
				Spacer()
				Text("\(oracleManager.currentGMACardViewModel.tagSymbol2)")
					.font(.system(size:20))
					.fontWeight(.bold)
					.frame(width: 50.0)
				Spacer()
				Text("\(oracleManager.currentGMACardViewModel.tagSymbol3)")
					.font(.system(size:20))
					.fontWeight(.bold)
					.frame(width: 50.0)
				Spacer()
				Text("\(oracleManager.currentGMACardViewModel.scatterSymbol)")
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
					Text("\(oracleManager.currentGMACardViewModel.belongings)")
						.fontWeight(.bold)
						.frame(width: 150.0)
					Text("CATALYST")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleManager.currentGMACardViewModel.catalyst)")
						.fontWeight(.bold)
						.frame(width: 150.0)
					Text("LOCATION")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleManager.currentGMACardViewModel.location)")
						.fontWeight(.bold)
						.frame(width: 150.0)
				}
				.padding()
				Spacer()
				VStack(alignment: .center){
					Text("NAMES")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleManager.currentGMACardViewModel.name1)")
						.fontWeight(.bold)
					Text("\(oracleManager.currentGMACardViewModel.name2)")
						.fontWeight(.bold)
					Text("\(oracleManager.currentGMACardViewModel.name3)")
						.fontWeight(.bold)
					Text("VIRTUE")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleManager.currentGMACardViewModel.virtue)")
						.fontWeight(.bold)
					Text("VICE")
						.font(.subheadline)
						.padding(.vertical, 5.0)
					Text("\(oracleManager.currentGMACardViewModel.vice)")
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
		return GMATagBottonView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
