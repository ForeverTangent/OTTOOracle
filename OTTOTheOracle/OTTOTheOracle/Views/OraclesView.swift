//
//  OraclesView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct OraclesView: View {
	var body: some View {
		VStack(alignment: .center, spacing: 40.0) {
			ShowSimpleOraclesNavButton()
			ShowAdvancedOraclesNavButton()
		}.frame(height: 250.0)
			.navigationBarTitle("GM Oracles", displayMode: .inline)
	}
}

struct OraclesView_Previews: PreviewProvider {
    static var previews: some View {
        OraclesView()
    }
}
