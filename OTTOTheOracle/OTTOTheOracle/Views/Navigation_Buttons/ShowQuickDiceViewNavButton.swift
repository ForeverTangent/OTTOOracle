//
//  ShowQuickDiceViewNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/11/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowQuickDiceViewNavButton: View {
	var body: some View {
		NavigationLink(destination: QuickDiceView(diceSquareViewModel: DiceSquareViewModel())) {
			OTTOButton(buttonTitle: "Show Quick Dice View")
		}
		.onAppear() {
			print("Showing RPG Solo Oracle")
		}
	}
}

struct ShowQuickDiceViewNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowQuickDiceViewNavButton()
    }
}
