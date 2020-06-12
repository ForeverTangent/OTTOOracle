//
//  ShowACGeneratorNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowACGeneratorNavButton: View {
	var body: some View {
		NavigationLink(destination: AdventureCrafterGeneratorView()) {
			OTTOButton(buttonTitle: "Show Adventure Crafter")
		}
		.onAppear() {
			print("Showinf Adventure Crafter")
		}
	}
}

struct ShowACGeneratorNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowACGeneratorNavButton()
    }
}
