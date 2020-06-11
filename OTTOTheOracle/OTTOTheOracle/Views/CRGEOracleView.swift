//
//  CRGEOracleView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct CRGEOracleView: View {
	@ObservedObject var crgeOracleViewModel: CRGEOracleViewModel

	@State private var stage: Double = 1.0

	@State private var stagesSelectorIndex = 0
	@State private var stages = [
		CRGE_STAGE.getStageString(CRGE_STAGE.KNOWLEDGE),
		CRGE_STAGE.getStageString(CRGE_STAGE.CONFLICT),
		CRGE_STAGE.getStageString(CRGE_STAGE.ENDINGS)
	]

	var body: some View {
		VStack(spacing: 20.0) {
			Text("Stage")
			Picker("Stage", selection: $stagesSelectorIndex) {
				ForEach(0..<stages.count) { index in
					Text("\(self.stages[index])")
				}
			}
			.pickerStyle(SegmentedPickerStyle())
			Text("Surge")
				.padding(.top)
			Text("\(crgeOracleViewModel.surge, specifier: "%.0f")")
				.font(.title)
				.frame(height: nil)
			Slider(value: $crgeOracleViewModel.surge, in: 0...10, step: 2.0)
			VStack {
				Text("Answer:")
				Text("\(crgeOracleViewModel.answer)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
					.frame(height: 50.0)
			}
			VStack {
				Text("Unexpectedly:")
				Text("\(crgeOracleViewModel.unexpectedly)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
					.frame(height: 50.0)
					.contextMenu {
						Text("\(crgeOracleViewModel.unexpectedlyDescription)")
				}
				Button("Calculate") {
					print("Calculate")
					self.crgeOracleViewModel.getOracleResult(
						stage: CRGE_STAGE.init(
							rawValue: Int(self.stagesSelectorIndex)) ?? .KNOWLEDGE,
						surge: Int(self.crgeOracleViewModel.surge))
				}
				.padding(.vertical, 50.0)
				.foregroundColor(.blue)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
				)
			}
			.frame(width: 300.0)
		}
		.frame(width: 300.0)
	}
}

	struct CRGEOracleView_Previews: PreviewProvider {
		static var previews: some View {
			CRGEOracleView(crgeOracleViewModel: CRGEOracleViewModel())
		}
}
