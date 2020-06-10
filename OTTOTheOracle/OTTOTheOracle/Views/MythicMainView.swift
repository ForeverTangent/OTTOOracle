//
//  MythicMainView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicMainView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Environment(\.presentationMode) var presentation

	var body: some View {
		VStack {
			MythicCardView().environmentObject(oracleViewModel)
			Button("Reload") {
				self.oracleViewModel.drawMythicCard()
			}
			.foregroundColor(.blue)
			.padding(75.0)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
		.frame(height: 500.0)
	}
}

struct MythicMainView_Previews: PreviewProvider {
    static var previews: some View {
		MythicMainView().environmentObject(PreviewHelper.mockOracleWithSortedDeckUseCardIndex(0))
	}
}
