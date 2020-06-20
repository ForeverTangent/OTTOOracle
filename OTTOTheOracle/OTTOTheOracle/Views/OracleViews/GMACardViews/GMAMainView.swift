//
//  GMAMainView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/9/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMAMainView: View {
	@ObservedObject var oracleViewModel: OracleViewModel = OracleViewModel()

	var body: some View {
		ScrollView {
			VStack {
				GMACardOnlyView(oracleViewModel: oracleViewModel).padding(.vertical, 25.0)
				Group {
					Button("Reload") {
						self.oracleViewModel.drawGMACard()
					}
					.foregroundColor(.blue)
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.stroke(Color.blue, lineWidth: 5)
							.frame(width: 200.0, height: 50.0)
					)
				}
			}
		}
	}
}

struct GMAMainView_Previews: PreviewProvider {
    static var previews: some View {
		GMAMainView(oracleViewModel: OracleViewModel())
    }
}
