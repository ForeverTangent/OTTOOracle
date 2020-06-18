//
//  GeneratorsView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GeneratorsView: View {
	var body: some View {
		VStack(alignment: .center, spacing: 40.0) {
			ShowAdventureCrafterGeneratorNavButton()
			ShowCypherNPCGeneratorNavButton()
			ShowUNEGenratorNavButton()
		}.frame(height: 250.0)
			.navigationBarTitle("Generators", displayMode: .inline)
	}
}

struct GeneratorsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorsView()
    }
}
