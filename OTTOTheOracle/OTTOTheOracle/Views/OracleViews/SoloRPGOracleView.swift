//
//  SoloRPGView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct SoloRPGOracleView: View {
	@ObservedObject var soloRPGViewModel = SoloRPGViewModel()

	var body: some View {
		VStack(spacing: 50.0) {
			VStack {
				Text("Answer:")
				Text("\(soloRPGViewModel.answer)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
			}
			VStack {
				Text("Twist:")
				Text("\(soloRPGViewModel.twist)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
					.frame(height: 100.0)
			}
			Button("Calculate") {
				print("Calculate")
				self.soloRPGViewModel.getSoloRPGAnswer()
			}
			.foregroundColor(.blue)
			.padding(25.0)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
		.navigationBarTitle("Solo RPG", displayMode: .inline)
		.frame(width: 300.0)
	}
}

struct SoloRPGView_Previews: PreviewProvider {
    static var previews: some View {
        SoloRPGOracleView()
    }
}
