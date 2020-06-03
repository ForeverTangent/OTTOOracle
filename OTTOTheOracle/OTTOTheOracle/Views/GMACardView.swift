//
//  GMACardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMACardView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

//	var gmaCardViewModel: GMACardViewModel

    var body: some View {
		VStack {
			Text("GMACard")
			Text("\(oracleViewModel.currentGMACardViewModel.cardFile)")
				.padding(.all)
			GMATopView().environmentObject(oracleViewModel)
			GMADescriptionsView().environmentObject(oracleViewModel)
			GMATagBottonView().environmentObject(oracleViewModel)

		}
    }
}

struct GMACardView_Previews: PreviewProvider {
    static var previews: some View {
		return GMACardView().environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
