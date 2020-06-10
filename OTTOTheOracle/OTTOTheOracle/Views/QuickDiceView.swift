//
//  QuickDiceView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct QuickDiceView: View {
	@ObservedObject var randomDiceViewModel = JustDiceViewModel()

    var body: some View {
		VStack {
			Spacer()
//			GMADiceView(randomDiceViewModel: randomDiceViewModel, usingRandom: true)
//				.scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
			Spacer()
			Button("Reload") {
				self.randomDiceViewModel.getNewRollAll()
			}
			.foregroundColor(.blue)
			.padding(75.0)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
			Spacer()
		}
    }
}

struct QuickDiceView_Previews: PreviewProvider {
    static var previews: some View {
        QuickDiceView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
