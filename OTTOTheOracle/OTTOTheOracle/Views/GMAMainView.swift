//
//  GMAMainView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMAMainView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Environment(\.presentationMode) var presentation

	var body: some View {
		ScrollView {
			VStack {
				GMACardView().environmentObject(oracleViewModel)
				Button("Reload") {
					self.oracleViewModel.drawGMACard()
				}
				.foregroundColor(.blue)
				.padding(.top, 100.0)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
				)
			}
		}

	}
}

struct GMAMainView_Previews: PreviewProvider {
    static var previews: some View {
        GMAMainView().environmentObject(OracleViewModel())
    }
}
