//
//  ShowOraclesNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowOraclesNavButton: View {
    var body: some View {
		NavigationLink(destination: OraclesView()) {
			OTTOButton(buttonTitle: "Show Oracles")
		}
		.isDetailLink(false)
		.onAppear() {
			print("Show Oracles")
		}
    }
}

struct ShowOraclesNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowOraclesNavButton()
    }
}
