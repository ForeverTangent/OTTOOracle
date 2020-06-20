//
//  MythicBottomView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicBottomView: View {
	@ObservedObject var oracleViewModel: OracleViewModel

	var body: some View {
		VStack {
			VStack {
				Text("SCENE SETUP")
					.font(.subheadline)
				Text("\(oracleViewModel.currentMythicCardViewModel.sceneSetup)")
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
					.frame(height: 50.0)
			}
			.padding(.vertical, 5.0)
			VStack(spacing: 10.0) {
				Text("\(oracleViewModel.currentMythicCardViewModel.description1)")
					.fontWeight(.bold)
					.multilineTextAlignment(.leading)
				Text("DESCRIPTIONS")
					.font(.subheadline)
					.multilineTextAlignment(.center)
				Text("\(oracleViewModel.currentMythicCardViewModel.description2)")
					.fontWeight(.bold)
					.multilineTextAlignment(.trailing)
			}
			.padding(.vertical, 5.0)
			.frame(width: 360.0)
		}

	}
}

struct MythicBottomView_Previews: PreviewProvider {
    static var previews: some View {
		MythicBottomView(oracleViewModel: PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
