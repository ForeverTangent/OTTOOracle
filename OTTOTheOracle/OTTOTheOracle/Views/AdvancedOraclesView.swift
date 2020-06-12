//
//  AdvancedOraclesView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct AdvancedOraclesView: View {
	var body: some View {
		VStack(spacing: 50.0) {
			ShowAdvMythicCardNavButton()
			ShowFateOracleNavButton()
			ShowCypherOracleNavButton()
			ShowCRGEOracleNavButton()
		}.frame(height: 250.0)
			.navigationBarTitle("Advanced Oracles", displayMode: .inline)
	}
}

struct AdvancedOraclesView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedOraclesView()
    }
}
