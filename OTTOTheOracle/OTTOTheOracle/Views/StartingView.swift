//
//  ContentView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct StartingView: View {
	@EnvironmentObject var oracleManager: OracleViewModel

	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 40.0) {
				SimpleOraclesNavButton()
				AdvancedOraclesNavButton()
			}.frame(height: 250.0)
				.navigationBarTitle("SOLO-RPG", displayMode: .inline)
		}.environmentObject(oracleManager)
	}
}

struct StartingView_Previews: PreviewProvider {
	static var previews: some View {
		StartingView().environmentObject(OracleViewModel())
	}
}
