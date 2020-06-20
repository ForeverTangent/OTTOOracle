//
//  GMACardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMACardOnlyView: View {
	@ObservedObject var oracleViewModel: OracleViewModel

    var body: some View {
		VStack {
//			Text("\(oracleViewModel.currentGMACardViewModel.cardFile)")
//				.font(.subheadline)
//				.padding(.bottom)
			GMATopView(oracleViewModel: oracleViewModel)
			GMADescriptionsView(oracleViewModel: oracleViewModel)
			GMATagBottonView(oracleViewModel: oracleViewModel)

		}
    }
}

struct GMACardOnlyView_Previews: PreviewProvider {
    static var previews: some View {
		return GMACardOnlyView(oracleViewModel: PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
