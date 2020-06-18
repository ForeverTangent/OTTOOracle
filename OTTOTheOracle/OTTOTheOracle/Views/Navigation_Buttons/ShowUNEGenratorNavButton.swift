//
//  ShowUNEGenratorNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowUNEGenratorNavButton: View {
	var body: some View {
		NavigationLink(destination: UNEGeneratorView()) {
			OTTOButton(buttonTitle: "UNE NPC Generator")
		}
		.onAppear() {
			print("Showing UNE NPC Generator")
		}
	}
}

struct ShowUNEGenratorNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowUNEGenratorNavButton()
    }
}
