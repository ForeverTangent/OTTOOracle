//
//  UNEGeneratorCharacterView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct UNEGeneratorCharacterView: View {
	@ObservedObject var uneGeneratorViewModel = UNEGeneratorViewModel()

    var body: some View {
		ScrollView {
			VStack {
				UNEGeneratorSubView(
					title: "Name",
					value: $uneGeneratorViewModel.uneCharacterViewModel.name)
				UNEGeneratorSubView(
					title: "Modifier",
					value: $uneGeneratorViewModel.uneCharacterViewModel.modifier)
				UNEGeneratorSubView(
					title: "Noun",
					value: $uneGeneratorViewModel.uneCharacterViewModel.noun)
				UNEGeneratorSubView(
					title: "Motivation Verb",
					value: $uneGeneratorViewModel.uneCharacterViewModel.motivationVerb)
				UNEGeneratorSubView(
					title: "Motivation Noun",
					value: $uneGeneratorViewModel.uneCharacterViewModel.motivationNoun)
			}
			.padding(.vertical)
			Button("Generate Character") {
				print("Generate Character Pressed")
				self.uneGeneratorViewModel.getRandomUNECharacter()
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
    }
}

struct UNEGeneratorCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        UNEGeneratorCharacterView()
    }
}
