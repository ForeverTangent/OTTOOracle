//
//  MythicCardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicCardView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		VStack {
			Text("MythicCard")
			Text("\(oracleViewModel.currentMythicCardViewModel.cardFile)")
			Text("\(String(oracleViewModel.currentMythicCardViewModel.forward))")
			MythicTopView().environmentObject(oracleViewModel)
			MythicMidView().environmentObject(oracleViewModel)
			MythicBottomView().environmentObject(oracleViewModel)
		}
	}
}

struct MythicCardView_Previews: PreviewProvider {
    static var previews: some View {
        MythicCardView().environmentObject(OracleViewModel())
    }
}
