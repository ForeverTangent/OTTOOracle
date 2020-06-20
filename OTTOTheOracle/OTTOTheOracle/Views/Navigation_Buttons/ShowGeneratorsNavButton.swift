//
//  ShowGeneratorsNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowGeneratorsNavButton: View {
	var body: some View {
		NavigationLink(destination: GeneratorsView()) {
			OTTOButton(buttonTitle: "Show Generators")
		}
		.isDetailLink(false)
		.onAppear() {
			print("Show Generators")
		}
	}
}

struct ShowGeneratorsNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowGeneratorsNavButton()
    }
}
