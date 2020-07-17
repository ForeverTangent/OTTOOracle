//
//  ContentView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI
import os

struct StartingView: View {

	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 40.0) {
				NavigationLink(destination: OraclesListView()) {
					OTTOButton(buttonTitle: "Oracles")
				}
				NavigationLink(destination: GeneratorsView()) {
					OTTOButton(buttonTitle: "Generators")
				}
			}.frame(height: 250.0)
				.navigationBarTitle("Main", displayMode: .inline)
		}
	}
}

struct StartingView_Previews: PreviewProvider {
	static var previews: some View {
		StartingView()
	}
}
