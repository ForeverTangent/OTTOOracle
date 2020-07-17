//
//  PETGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/22/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct PETGeneratorView: View {
	@ObservedObject var petGeneratorViewModel = PETGeneratorViewModel()

	var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				VStack() {
					Text("Name")
						.font(.title)
					Text("\(petGeneratorViewModel.petCharacterViewModel.name)")
				}
				Text("Agenda")
					.font(.title)
				if petGeneratorViewModel.petCharacterViewModel.agenda.isEmpty {
					Text("")
				} else {
					Text("\(petGeneratorViewModel.petCharacterViewModel.agenda)")
				}
				Text("Personality Tags")
					.font(.title)
				if petGeneratorViewModel.petCharacterViewModel.personalityTags.isEmpty {
					Text("")
				} else {
					ForEach(0..<petGeneratorViewModel.petCharacterViewModel.personalityTags.count) { index in
						Text("\(self.petGeneratorViewModel.petCharacterViewModel.personalityTags[index])")
					}
				}
				Text("Focus Tags")
					.font(.title)
				if petGeneratorViewModel.petCharacterViewModel.focusTags.isEmpty {
					Text("")
				} else {
					ForEach(0..<petGeneratorViewModel.petCharacterViewModel.focusTags.count) { index in
						Text("\(self.petGeneratorViewModel.petCharacterViewModel.focusTags[index])")
					}
				}
				Text("Seeds")
					.font(.title)
				if petGeneratorViewModel.petCharacterViewModel.seeds.isEmpty {
					Text("")
				} else {
					ForEach(0..<petGeneratorViewModel.petCharacterViewModel.seeds.count) { index in
						Text("\(self.petGeneratorViewModel.petCharacterViewModel.seeds[index])")
					}
				}
				Button("Generate PET Character") {
					print("Generate New PET Character")
					self.petGeneratorViewModel.generateRandomPETCharacter()
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
			.frame(width: 300.0)
		}
		.frame(width: nil)
	}
}

struct PETGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        PETGeneratorView()
    }
}
