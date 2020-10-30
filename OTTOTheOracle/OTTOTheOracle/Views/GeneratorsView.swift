//
//  GeneratorsView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GeneratorsView: View {
	var body: some View {
		VStack(alignment: .center, spacing: 40.0) {
			NavigationLink(destination: AdventureCrafterGeneratorView()) {
				OTTOButton(buttonTitle: "Show Adventure Crafter")
			}
			NavigationLink(destination: CypherNPCGeneratorView()) {
				OTTOButton(buttonTitle: "Cypher NPC Generator")
			}
			NavigationLink(destination: UNEGeneratorView()) {
				OTTOButton(buttonTitle: "UNE NPC Generator")
			}
			NavigationLink(destination: PETGeneratorView()) {
				OTTOButton(buttonTitle: "PET Generator")
			}
		}.frame(height: 250.0)
			.navigationBarTitle("Generators", displayMode: .inline)
	}
}

struct GeneratorsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorsView()
    }
}
