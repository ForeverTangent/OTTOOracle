//
//  ShowCypherOracleNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowCypherOracleNavButton: View {
	var body: some View {
		NavigationLink(destination: CypherOracleView(cypherOracleViewModel: CypherOracleViewModel())) {
			OTTOButton(buttonTitle: "Show Cypher Oracle")
		}
		.onAppear() {
			print("Show Cypher Oracle")
		}
	}
}

struct ShowCypherOracleNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowCypherOracleNavButton()
    }
}
