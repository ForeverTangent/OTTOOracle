//
//  MythicBottomView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicBottomView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		VStack {
			HStack {
				Text("SCENE SETUP")
					.font(.subheadline)
				Text("\(oracleViewModel.currentMythicCardViewModel.sceneSetup)")
					.fontWeight(.bold)
			}
			.padding(.vertical, 5.0)
			HStack {
				Text("\(oracleViewModel.currentMythicCardViewModel.description1)")
					.fontWeight(.bold)
				Text("DESCRIPTIONS")
					.font(.subheadline)
				Text("\(oracleViewModel.currentMythicCardViewModel.description2)")
					.fontWeight(.bold)
			}
			.padding(.vertical, 5.0)
			.frame(width: 360.0)
		}

	}
}

struct MythicBottomView_Previews: PreviewProvider {
    static var previews: some View {
		MythicBottomView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
