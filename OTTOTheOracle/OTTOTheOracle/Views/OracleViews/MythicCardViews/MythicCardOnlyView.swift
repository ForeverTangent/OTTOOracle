//
//  MythicCardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicCardOnlyView: View {
	@ObservedObject var oracleViewModel: OracleViewModel

	var body: some View {
		VStack {
//			Text("\(oracleViewModel.currentMythicCardViewModel.cardFile)")
//				.padding(.vertical)
			MythicTopView(oracleViewModel: oracleViewModel)
			MythicMidView(oracleViewModel: oracleViewModel).padding(.vertical)
			MythicBottomView(oracleViewModel: oracleViewModel)
		}
	}
}

struct MythicCardView_Previews: PreviewProvider {
    static var previews: some View {
		MythicCardOnlyView(oracleViewModel: OracleViewModel())
    }
}
