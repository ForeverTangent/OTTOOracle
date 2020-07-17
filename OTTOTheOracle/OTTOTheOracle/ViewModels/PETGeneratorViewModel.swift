//
//  PETGeneratorViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/22/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class PETGeneratorViewModel: ObservableObject {
	var petGeneratorModel = PETGeneratorModel()

	@Published var petCharacterViewModel: PETCharacterViewModel

	init() {
		petCharacterViewModel = PETCharacterViewModel()
	}

	func getFormatterPETCharacter(_ character: PETCharacter) -> PETCharacterViewModel {
		let name = character.name
		let agenda = character.agenda.descriptionShort
		let personalityTags = character.personalityTags.map{ $0.descriptionShort }
		let focusTags = character.focusTags.map{ $0.descriptionShort }
		let seeds = character.seeds.map{ $0.descriptionShort }

		return PETCharacterViewModel(name: name,
									 agenda: agenda,
									 personalityTags: personalityTags,
									 seeds: focusTags,
									 focusTags: seeds)
	}

	func generateRandomPETCharacter() {
		petGeneratorModel.buildNewPETCharacter()
		petCharacterViewModel = getFormatterPETCharacter(petGeneratorModel.petCharacter)
	}


}

struct PETCharacterViewModel {
	var name: String = ""
	var agenda: String = ""
	var personalityTags = [String]()
	var seeds = [String]()
	var focusTags = [String]()

}
