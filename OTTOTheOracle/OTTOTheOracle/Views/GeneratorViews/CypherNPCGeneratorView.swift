//
//  CypherNPCGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/14/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI


struct CypherNPCGeneratorView: View {
	@ObservedObject var cypherNPCViewModel = CypherNPCViewModel()

	var body: some View {
		ScrollView {
			VStack {
				CypherNPCGeneratorSubView(title: "Name",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.name)
				CypherNPCGeneratorSubView(title: "Description",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.description)
				CypherNPCGeneratorSubView(title: "Type",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.type)
				CypherNPCGeneratorSubView(title: "Focus A",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.characterFocusA)
				CypherNPCGeneratorSubView(title: "Focus B",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.characterFocusB)
			}
			.padding(.vertical)
			VStack {
				CypherNPCGeneratorSubView(title: "Motivation",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.characterMotivation)
				CypherNPCGeneratorSubView(title: "Tone",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.interactionTone)
				CypherNPCGeneratorSubView(title: "Descriptor A",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.interactionDescriptorA)
				CypherNPCGeneratorSubView(title: "Descriptor B",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.interactionDescriptorB)
				CypherNPCGeneratorSubView(title: "Focus",
										  value: $cypherNPCViewModel.displayedCypherNPRCharacterViewModel.interactionFocus)
			}
			.padding(.vertical)
			Button("Generate New Character") {
				print("Generate New Character Pressed")
				self.cypherNPCViewModel.generateCypherNPCCharacter()
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
		.navigationBarTitle("Cypher NPC", displayMode: .inline)
	}
}

struct CypherNPCGeneratorSubView: View {
	 var title: String = ""
	@Binding var value: String

	var body: some View {
		VStack {
			Text("\(title)")
				.font(.subheadline)
				.multilineTextAlignment(.center)
				.frame(width: 300.0)
			Text("\(value)")
				.font(.title)
				.multilineTextAlignment(.center)
			.frame(width: 300.0)
		}
		.padding(.vertical, 5.0)
	}

}




struct CypherNPCGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        CypherNPCGeneratorView(cypherNPCViewModel: CypherNPCViewModel())
    }
}
