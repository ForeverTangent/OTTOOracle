//
//  SimpleOraclesView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct SimpleOraclesView: View {
	var body: some View {
		VStack(spacing: 50.0) {
			ShowQuickDiceViewNavButton()
			ShowRPGSoloOracleNavButton()
			ShowMythicCardNavButton()
			ShowGMACardNavButton()
		}.frame(height: 250.0)
			.navigationBarTitle("Simple Oracles", displayMode: .inline)
	}
}

struct SimpleOraclesView_Previews: PreviewProvider {
    static var previews: some View {
		SimpleOraclesView()
    }
}
