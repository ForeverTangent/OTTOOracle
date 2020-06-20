//
//  MythicAdvancedView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicAdvancedView: View {
	@ObservedObject var oracleViewModel: OracleViewModel = OracleViewModel()
	@Environment(\.presentationMode) var presentation

	@State private var difficulty: Double = 6.0
	@State private var chaosFactor: Double = 5.0

	var body: some View {
		ScrollView {
			VStack {
				VStack(spacing: 10.0) {
					Text("Difficulty \(difficulty, specifier: "%.0f")")
					Slider(value: $difficulty, in: 1...11, step: 1.0)
					Text("Chaos Level \(chaosFactor, specifier: "%.0f")")
					Slider(value: $chaosFactor, in: 1...9, step: 1.0)
				}
				.padding(.horizontal, 40.0)
				MythicCardOnlyView(oracleViewModel: oracleViewModel)
					.environmentObject(oracleViewModel)
					.background(Color.green)
				Button("Calculate") {
					print("Calculate")
					guard let mythicRank = MYTHIC_FATE_RANK.init(rawValue: Int(self.difficulty)) else  { return }
					self.oracleViewModel.getMythicOracleResult(difficulty: mythicRank, chaosFactor: Int(self.chaosFactor))
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
