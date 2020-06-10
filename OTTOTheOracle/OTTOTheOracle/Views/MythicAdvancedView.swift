//
//  MythicAdvancedView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicAdvancedView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Environment(\.presentationMode) var presentation

	@State private var difficulty: Double = 6.0
	@State private var chaosLevel: Double = 5.0

	var body: some View {
		ScrollView {
			VStack {
				VStack(spacing: 10.0) {
					Text("Difficulty \(difficulty, specifier: "%.0f")")
					Slider(value: $difficulty, in: 1...11, step: 1.0)
					Text("Chaos Level \(chaosLevel, specifier: "%.0f")")
					Slider(value: $chaosLevel, in: 1...9, step: 1.0)
				}
				.padding(.horizontal, 40.0)
				MythicSimpleCardView()
					.environmentObject(oracleViewModel)
					.background(Color.green)
				Button("Calculate") {
					self.oracleViewModel.drawMythicCard()
				}
				.foregroundColor(.blue)
				.padding(25.0)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
				)
			}
		}
	}
}

struct MythicAdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        MythicAdvancedView().environmentObject(PreviewHelper.mockOracleWithSortedDeckUseCardIndex(0))
    }
}
