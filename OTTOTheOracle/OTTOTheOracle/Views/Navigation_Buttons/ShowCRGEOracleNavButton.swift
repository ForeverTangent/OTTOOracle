//
//  ShowCRGEOracleNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowCRGEOracleNavButton: View {
	var body: some View {
		NavigationLink(destination: CRGEOracleView(crgeOracleViewModel: CRGEOracleViewModel())) {
			OTTOButton(buttonTitle: "Show CRGE Oracle")
		}
		.onAppear() {
			print("Show CRGE Oracle")
		}
	}
}

struct ShowCRGEOracleNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowCRGEOracleNavButton()
    }
}
