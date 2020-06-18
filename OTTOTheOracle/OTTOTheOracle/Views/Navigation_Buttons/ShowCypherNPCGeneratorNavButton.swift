//
//  ShowCypherNPCGeneratorNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowCypherNPCGeneratorNavButton: View {
    var body: some View {
		NavigationLink(destination: CypherNPCGeneratorView()) {
			OTTOButton(buttonTitle: "Cypher NPC Generator")
		}
		.onAppear() {
			print("Showing Cypher NPC Generator")
		}
    }
}

struct ShowCypherNPCGeneratorNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowCypherNPCGeneratorNavButton()
    }
}
