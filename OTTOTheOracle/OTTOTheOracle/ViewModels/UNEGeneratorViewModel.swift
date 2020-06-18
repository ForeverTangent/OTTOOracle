//
//  UNEGeneratorViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class UNEGeneratorViewModel: ObservableObject {
	private var uneGeneratorModel = UNEGeneratorModel()

	@Published var uneCharacterViewModel: UNECharacterViewModel
	@Published var uneInteractionViewModel: UNEInteractionViewModel


	init() {
		uneCharacterViewModel = UNECharacterViewModel()
		uneInteractionViewModel = UNEInteractionViewModel()
	}


	func getRandomUNECharacter() {
		let character = uneGeneratorModel.getRandomCharacter()
		uneCharacterViewModel = getFormatterUNECharacter(character)
	}


	func getUNEInteractionFrom(relationshipStatus status: UNE_NPC_RELATIONSHIP_STATUS,
							   andDemeanor demeanor: UNE_NPC_DEMEANOR) {
		let uneInteractionModel = uneGeneratorModel.getInteractionFrom(relationshipStatus: status, andDemeanor: demeanor)
		uneInteractionViewModel = getFormatterUNEInteraction(uneInteractionModel)
	}


	private func getFormatterUNECharacter(_ character: UNECharacter) -> UNECharacterViewModel {
		let uneCharacterViewModel = UNECharacterViewModel(name: character.name,
														  modifier: character.modifier.rawValue.capitalized,
														  noun: character.noun.rawValue.capitalized,
														  motivationVerb: character.motivationVerb.rawValue.capitalized,
														  motivationNoun: character.motivationNoun.rawValue.capitalized)
		return uneCharacterViewModel
	}


	private func getFormatterUNEInteraction(_ interaction: UNEInteraction) -> UNEInteractionViewModel {

		let status = UNE_NPC_RELATIONSHIP_STATUS.getElementString(interaction.relationshipStatus)
		let demeanor = UNE_NPC_DEMEANOR.getElementString(interaction.demeanor)

		let uneInteractionViewModel = UNEInteractionViewModel(relationshipStatus: status,
															  conversationMood: interaction.conversationMood.rawValue.capitalized,
															  demeanor: demeanor,
															  bearing: interaction.bearing.rawValue.capitalized,
															  focus: interaction.focus.rawValue.capitalized)
		return uneInteractionViewModel
	}


}


struct UNECharacterViewModel {
	var name: String = ""
	var modifier: String = ""
	var noun: String = ""
	var motivationVerb: String = ""
	var motivationNoun: String = ""
}


struct UNEInteractionViewModel {
	var relationshipStatus: String = ""
	var conversationMood: String = ""
	var demeanor: String = ""
	var bearing: String = ""
	var focus: String = ""
}
