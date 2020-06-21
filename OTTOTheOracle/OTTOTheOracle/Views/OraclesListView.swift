//
//  OraclesListView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/21/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct OraclesListView: View {
	var body: some View {
		ScrollView {
			Section(header: Text("Simple")
				.font(.title)
				.padding(.all)) {
					VStack(spacing: 20.0)  {
						NavigationLink(destination: QuickDiceView(diceSquareViewModel: DiceSquareViewModel())) {
							OTTOButton(buttonTitle: "Quick Dice")
						}
						NavigationLink(destination: SoloRPGOracleView()) {
							OTTOButton(buttonTitle: "Solo RPG")
						}
						NavigationLink(destination: MythicSimpleView()) {
							OTTOButton(buttonTitle: "Mythic")
						}
						NavigationLink(destination: GMAMainView()) {
							OTTOButton(buttonTitle: "GMA")
						}
					}
			}
			.frame(width: 200.0)
			Section(header: Text("Advanced")
				.font(.title)
				.padding(.all)) {
					VStack(spacing: 20.0)  {
						NavigationLink(destination: MythicAdvancedView()) {
							OTTOButton(buttonTitle: "Mythic Dice")
						}
						NavigationLink(destination: FateOracleView(fateOracleViewModel: FateOracleViewModel())) {
							OTTOButton(buttonTitle: "Fate SOLO")
						}
						NavigationLink(destination: CypherOracleView(cypherOracleViewModel: CypherOracleViewModel())) {
							OTTOButton(buttonTitle: "Cypher")
						}
						NavigationLink(destination: CRGEOracleView(crgeOracleViewModel: CRGEOracleViewModel())) {
							OTTOButton(buttonTitle: "CRGE")
						}
					}
			}
			.frame(width: 200.0)
		}
		.navigationBarTitle("Oracles", displayMode: .inline)
	}
}

struct OraclesListView_Previews: PreviewProvider {
	static var previews: some View {
		OraclesListView()
	}
}
