//
//  ShowFateOracleNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowFateOracleNavButton: View {
	var body: some View {
		NavigationLink(destination: FateOracleView(fateOracleViewModel: FateOracleViewModel())) {
			OTTOButton(buttonTitle: "Show Fate Oracle")
		}
		.onAppear() {
			print("Show Fate Oracle")
		}

	}
}

struct ShowFateOracleNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowFateOracleNavButton()
    }
}
