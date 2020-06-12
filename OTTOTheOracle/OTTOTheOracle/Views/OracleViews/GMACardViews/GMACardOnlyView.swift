//
//  GMACardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMACardOnlyView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

    var body: some View {
		VStack {
//			Text("\(oracleViewModel.currentGMACardViewModel.cardFile)")
//				.font(.subheadline)
//				.padding(.bottom)
			GMATopView().environmentObject(oracleViewModel)
			GMADescriptionsView().environmentObject(oracleViewModel)
			GMATagBottonView().environmentObject(oracleViewModel)

		}
    }
}

struct GMACardOnlyView_Previews: PreviewProvider {
    static var previews: some View {
		return GMACardOnlyView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
