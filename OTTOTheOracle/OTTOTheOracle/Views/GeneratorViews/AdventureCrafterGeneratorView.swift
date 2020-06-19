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
			ThemesSubView(adventureCrafterGeneratorVM: adventureCrafterGeneratorVM)
			PlotPointsSubView(adventureCrafterGeneratorVM: adventureCrafterGeneratorVM)
			CharacterSubView(adventureCrafterGeneratorVM: adventureCrafterGeneratorVM)
		}
		.font(.headline)

	}

}

struct AdventureCrafterGeneratorView_Previews: PreviewProvider {
	static var previews: some View {
		AdventureCrafterGeneratorView(adventureCrafterGeneratorVM: AdventureCrafterViewModel())
	}
}

struct ThemesSubView: View {
	@ObservedObject var adventureCrafterGeneratorVM: AdventureCrafterViewModel

	var body: some View {
		ScrollView {
			VStack(spacing: 20.0) {
				ForEach(self.adventureCrafterGeneratorVM.adventureThemesViewModel) { (theme) in
					Text("\(theme.title)")
						.font(.title)
						.padding(.vertical, 5.0)
						.frame(width: 300.0)
				}
			}
			.frame(height: 300.0)
			Button("Generate New Theme") {
				print("Generate New Themes Pressed")
				self.adventureCrafterGeneratorVM.generateNewAdventureThemesModel()
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
		.padding(.top, 50.0)
		.tabItem {
			Image(systemName: "1.square.fill")
			Text("Themes")
		}
	}
}

struct PlotPointsSubView: View {
	@ObservedObject var adventureCrafterGeneratorVM: AdventureCrafterViewModel

	var body: some View {
		ScrollView {
			VStack(spacing: 20.0) {
				ForEach(self.adventureCrafterGeneratorVM.plotPointsViewModel) { (plotPointsViewModel) in
					TextPopUpView(displayedText: plotPointsViewModel.descriptionShort,
								  popUpText: plotPointsViewModel.descriptionLong)
						.font(.title)
						.frame(width: 300.0)
						.multilineTextAlignment(.center)
				}
			}
			.frame(height: 300.0)
			Button("Generate Plot Points") {
				print("Generate Plot Points Pressed")
				self.adventureCrafterGeneratorVM.generateNewTurningPointPlotPoints()
			}
			.onAppear() {
				print("Plot Point Tab Appears")
			}
			.padding(.vertical, 20.0)
			.foregroundColor(.blue)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
		.padding(.top, 50.0)
		.tabItem {
			Image(systemName: "1.square.fill")
			Text("Plot Points")
		}
	}
}

struct CharacterSubView: View {
	@ObservedObject var adventureCrafterGeneratorVM: AdventureCrafterViewModel

	var body: some View {
		ScrollView {
			VStack(spacing: 20.0) {
				ForEach(self.adventureCrafterGeneratorVM.characterDataViewModel.identities) { (identity) in
					Text("\(identity.identity)")
						.font(.title)
						.multilineTextAlignment(.center)
						.frame(width: 300.0)
				}
			}
			.padding(.vertical, 20.0)
			VStack {
				ForEach(self.adventureCrafterGeneratorVM.characterDataViewModel.descriptors) { (descriptor) in
					Text("\(descriptor.descriptorShort)")
						.font(.title)
						.multilineTextAlignment(.center)
						.padding(.vertical, 5.0)
						.frame(width: 300.0)
				}
			}
			Button("Generate Character") {
				print("Generate Character Pressed")
				self.adventureCrafterGeneratorVM.generateNewCharacter()
			}
			.onAppear() {
				print("Character Tab Appears")
			}
			.padding(.vertical, 50.0)
			.frame(width: 300.0)
			.foregroundColor(.blue)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
		.padding(.top, 50.0)
		.tabItem {
			Image(systemName: "3.square.fill")
			Text("Characters") }
	}
}
