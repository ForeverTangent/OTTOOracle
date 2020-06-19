//
//  FateViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct FateOracleView: View {
	@ObservedObject var fateOracleViewModel: FateOracleViewModel

	@State private var difficulty: Double = 3.0

    var body: some View {
		VStack(spacing: 25.0) {
			Text("Difficulty \(difficulty, specifier: "%.0f")")
			Text("\(FATE_ORACLE_RANK.init(rawValue: Int(difficulty))?.descriptionShort ?? "")")
				.font(.title)
			Slider(value: $difficulty, in: 1...5, step: 1.0)
			VStack {
				Text("Answer:")
				Text("\(fateOracleViewModel.answer)")
					.font(.largeTitle)
			}
			VStack {
				Text("Suprise:")
				Text("\(fateOracleViewModel.surprise)")
					.font(.largeTitle)
			}
			Button("Calculate") {
				print("Calculate")
				guard let fateOracleRank = FATE_ORACLE_RANK.init(rawValue: Int(self.difficulty)) else  { return }
				self.fateOracleViewModel.getFateOracleAnswerWithRank(fateOracleRank)
			}
			.foregroundColor(.blue)
			.padding(25.0)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
		.frame(width: 300.0)
    }
}

struct FateViewModel_Previews: PreviewProvider {
    static var previews: some View {
        FateOracleView(fateOracleViewModel: FateOracleViewModel())
    }
}
