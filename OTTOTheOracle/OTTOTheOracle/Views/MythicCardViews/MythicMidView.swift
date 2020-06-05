//
//  MythicMidView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicMidView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

    var body: some View {
		HStack {
			Spacer()
			VStack {
				Text("EXCPTNL!")
					.font(.subheadline)
					.fontWeight(.bold)
					.multilineTextAlignment(.leading)
					.isHidden(!oracleViewModel.currentMythicCardViewModel.exceptional)
					.accessibility(hidden: !oracleViewModel.currentMythicCardViewModel.exceptional)
					.rotationEffect(.degrees(-90.0))
			}
			.frame(width: 100.0)
			Spacer()
			VStack() {
				Text("\(oracleViewModel.currentMythicCardViewModel.result)")
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(Color.red)
					.padding()
					.frame(width: 100.0, height: 100.0)
					.background(Color.yellow)
			}
			Spacer()
			VStack {
				Text("RANDOM")
					.accessibility(hidden: !oracleViewModel.currentMythicCardViewModel.hasCFRandomRange)
				Text("\(oracleViewModel.currentMythicCardViewModel.randomRange)")
					.fontWeight(.bold)
					.accessibility(hidden: !oracleViewModel.currentMythicCardViewModel.hasCFRandomRange)
			}
			.frame(width: 100.0)
			.isHidden(oracleViewModel.currentMythicCardViewModel.hasCFRandomRange)
			Spacer()
		}
		.frame(width: 360.0, height: 120.0)
    }
}

struct MythicMidView_Previews: PreviewProvider {
    static var previews: some View {
		MythicMidView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
