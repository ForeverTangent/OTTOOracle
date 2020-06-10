//
//  QuickDiceView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct QuickDiceView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

    var body: some View {
		VStack(spacing: 50.0) {
			GMADiceView()
				.environmentObject(oracleViewModel)
				.scaleEffect(2.0)
			Button("Reroll") {
				self.oracleViewModel.getNewDiceSquareRoll()
			}
			.foregroundColor(.blue)
			.padding(75.0)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
    }
}

struct QuickDiceView_Previews: PreviewProvider {
    static var previews: some View {
		QuickDiceView().environmentObject(OracleViewModel())
    }
}
