//
//  AdventureCrafterGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct AdventureCrafterGeneratorView: View {
	@ObservedObject var adventureCrafterGeneratorVM = AdventureCrafterViewModel()

	var body: some View {
		TabView {
			VStack {
				VStack {
					ForEach(self.adventureCrafterGeneratorVM.themes) { (theme) in
						Text("\(theme.title)")
							.font(.title)
							.padding(.vertical, 5.0)
							.frame(width: 300.0)
					}
				}
				.frame(height: 250.0)
				Button("Calculate") {
					print("Calculate")
				}
				.onAppear() {
					print("Themes Tab Appears")
				}
				.padding(.vertical, 50.0)
				.foregroundColor(.blue)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
				)
			}
			.padding(.top, 100.0)
			.tabItem {
				Image(systemName: "1.square.fill")
				Text("Themes")
			}
			VStack {
				VStack {
					ForEach(self.adventureCrafterGeneratorVM.plotPoints) { (turningPoint) in
						Text("\(turningPoint.plotPoint)")
							.font(.title)
							.multilineTextAlignment(.center)
							.padding(.vertical, 5.0)
							.frame(width: 300.0)
					}
				}
				.frame(height: 250.0)
				Button("Calculate") {
					print("Calculate")
				}
				.onAppear() {
					print("Themes Tab Appears")
					self.adventureCrafterGeneratorVM.generateNewTurningPointPlotPoints()
				}
				.padding(.vertical, 50.0)
				.foregroundColor(.blue)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
				)
			}
			.padding(.top, 100.0)
			.tabItem {
				Image(systemName: "1.square.fill")
				Text("Plot Points")
			}
			Text("The Last Tab")
				.tabItem {
					Image(systemName: "3.square.fill")
					Text("Characters")
			}
		}
		.font(.headline)

	}

}

struct AdventureCrafterGeneratorView_Previews: PreviewProvider {
	static var previews: some View {
		AdventureCrafterGeneratorView(adventureCrafterGeneratorVM: AdventureCrafterViewModel())
	}
}
