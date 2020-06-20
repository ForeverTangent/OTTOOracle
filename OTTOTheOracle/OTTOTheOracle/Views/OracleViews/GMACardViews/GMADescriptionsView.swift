//
//  GMADescriptionView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMADescriptionsView: View {
	@ObservedObject var oracleViewModel: OracleViewModel
	
//	var gmaCardViewModel: GMACardViewModel

    var body: some View {
		VStack {
			HStack {
				Spacer()
				Text("\(oracleViewModel.currentGMACardViewModel.description1)")
					.fontWeight(.bold)
					.padding(.leading)
				Spacer()
				Text("\(oracleViewModel.currentGMACardViewModel.description2)")
					.fontWeight(.bold)
					.padding(.horizontal, 5.0)
				Spacer()
				Text("\(oracleViewModel.currentGMACardViewModel.description3)")
					.fontWeight(.bold)
					.padding(.trailing)
				Spacer()
			}
			.frame(height: 30.0)
			HStack() {
				VStack(alignment: .leading) {
					Text("SOUND")
						.font(.subheadline)
						.frame(height: 30.0)
					Text("SIGHT")
						.font(.subheadline)
						.frame(height: 30.0)
					Text("TOUCH")
						.font(.subheadline)
						.frame(height: 30.0)
					Text("SMELL")
						.font(.subheadline)
						.frame(height: 30.0)
				}
				.padding(.leading, 5.0)
				.frame(width: 70.0)
				VStack(alignment: .leading) {
					Text("\(oracleViewModel.currentGMACardViewModel.sensorySound)")
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.frame(width: 250.0, height: 30.0)
					Text("\(oracleViewModel.currentGMACardViewModel.sensoryVisual)")
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.frame(width: 250.0, height: 30.0)
					Text("\(oracleViewModel.currentGMACardViewModel.sensoryTouch)")
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.frame(width: 250.0, height: 30.0)
					Text("\(oracleViewModel.currentGMACardViewModel.sensorySmell)")
						.fontWeight(.bold)
						.multilineTextAlignment(.leading)
						.frame(width: 250.0, height: 30.0)
				}
				.padding(.trailing, 5.0)
				.frame(width: 250.0, height: 120.0)
			}
		}
		.frame(width: 360.0)
    }
}

struct GMADescriptionView_Previews: PreviewProvider {
    static var previews: some View {
		return GMADescriptionsView(oracleViewModel: PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
