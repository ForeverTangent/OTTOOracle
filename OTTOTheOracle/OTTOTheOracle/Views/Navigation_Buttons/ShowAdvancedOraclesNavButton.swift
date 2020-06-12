//
//  AdvancedOraclesButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowAdvancedOraclesNavButton: View {
	var body: some View {
		NavigationLink(destination: AdvancedOraclesView()) {
			OTTOButton(buttonTitle: "Advanced Oracles")
		}
		.onAppear() {
			print("Showing RPG Solo Oracle")
		}
	}
}

struct AdvancedOraclesButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowAdvancedOraclesNavButton()
    }
}
