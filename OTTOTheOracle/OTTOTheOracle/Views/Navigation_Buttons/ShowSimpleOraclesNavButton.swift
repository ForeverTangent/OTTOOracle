//
//  SimpleOraclesButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowSimpleOraclesNavButton: View {
	var body: some View {
		NavigationLink(destination: SimpleOraclesView()) {
			OTTOButton(buttonTitle: "Simple Oracles")
		}
		.onAppear() {
			print("Showing RPG Solo Oracle")
		}
	}
}

struct SimpleOraclesButton_Previews: PreviewProvider {
    static var previews: some View {
		ShowSimpleOraclesNavButton()
    }
}
