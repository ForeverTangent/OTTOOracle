//
//  CypherNPCViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/14/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class CypherNPCViewModel: ObservableObject {
	private var cypherNPCGeneratorModel = CypherNPCGeneratorModel()

	@Published var displayedCypherNPRCharacterViewModel = DisplayedCypherNPCCharacterViewModel()

	init() {
		self.generateCypherNPCCharacter()
	}

	func generateCypherNPCCharacter() {
		let cypherNPCCharacter = cypherNPCGeneratorModel.getRandomCharacter()
		let formattedNPCData = getFormattedCypherNPCCharacter(cypherNPCCharacter)
		setDisplayedCypherNPRCharacterViewModel(formattedNPCData)

	}

	private func getFormattedCypherNPCCharacter(_ npcCharacter: CypherNPRCharacter) -> DisplayedCypherNPCCharacterViewModel {
		displayedCypherNPRCharacterViewModel = DisplayedCypherNPCCharacterViewModel(
			name: npcCharacter.name,
			description: npcCharacter.description.rawValue.capitalized,
			type: npcCharacter.type.rawValue.capitalized,
			characterFocusA: npcCharacter.characterFocusA.rawValue.capitalized,
			characterFocusB: npcCharacter.characterFocusB.rawValue.capitalized,
			characterMotivation: npcCharacter.characterMotivation.rawValue.capitalized,
			interactionTone: npcCharacter.interactionTone.rawValue.capitalized,
			interactionDescriptorA: npcCharacter.interactionDescriptorA.rawValue.capitalized,
			interactionDescriptorB: npcCharacter.interactionDescriptorA.rawValue.capitalized,
			interactionFocus: npcCharacter.interactionFocus.rawValue.capitalized)

		return displayedCypherNPRCharacterViewModel
	}

	private func setDisplayedCypherNPRCharacterViewModel(_ data: DisplayedCypherNPCCharacterViewModel) {
		displayedCypherNPRCharacterViewModel = data
	}

}


struct DisplayedCypherNPCCharacterViewModel {
	var name: String = ""
	var description: String = ""
	var type: String = ""
	var characterFocusA: String = ""
	var characterFocusB: String = ""
	var characterMotivation: String = ""
	var interactionTone: String = ""
	var interactionDescriptorA: String = ""
	var interactionDescriptorB: String = ""
	var interactionFocus: String = ""

}
