//
//  CypherOracleView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct CypherOracleView: View {
	@ObservedObject var cypherOracleViewModel: CypherOracleViewModel

	@State private var adventureStatus: Double = 3.0
	@State private var gmConsult: Double = 3.0

	var body: some View {
		VStack(spacing: 10.0) {
			Text("Adventure Status \(adventureStatus, specifier: "%.0f")")
			Text("\(CYPHER_ADVENTURE_STATUS.init(rawValue: Int(adventureStatus))?.descriptionShort ?? "" )")
				.font(.title)
			Slider(value: $adventureStatus, in: 1...6, step: 1.0)
			Text("GM Consult \(gmConsult, specifier: "%.0f")")
			Text("\(CYPHER_GM_CONSULT.init(rawValue: Int(gmConsult))?.descriptionShort ?? "" )")
				.font(.title)
				.frame(height: nil)
			Slider(value: $gmConsult, in: 1...6, step: 1.0)
			VStack {
				Text("Answer:")
				Text("\(cypherOracleViewModel.answer)")
					.font(.largeTitle)
			}
			VStack {
				Text("Developer:")
				Text("\(cypherOracleViewModel.developer)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
					.frame(height: 100.0)
			}
			Button("Calculate") {
				print("Calculate")
				self.cypherOracleViewModel.getOracleResult(
					adventureStatus: CYPHER_ADVENTURE_STATUS.init(rawValue: Int(self.adventureStatus)) ?? .AVERAGE,
					gmConsult: CYPHER_GM_CONSULT.init(rawValue: Int(self.gmConsult)) ?? .AVERAGE)

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

struct CypherOracleView_Previews: PreviewProvider {
    static var previews: some View {
        CypherOracleView(cypherOracleViewModel: CypherOracleViewModel())
    }
}
