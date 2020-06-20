//
//  MythicTopView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicTopView: View {
	@ObservedObject var oracleViewModel: OracleViewModel
	
    var body: some View {
		HStack {
			VStack {
				Text("SUBJECT")
					.frame(height: 50.0)
					.accessibility(hidden: true)
				Text("\(oracleViewModel.currentMythicCardViewModel.subject)")
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
					.frame(width: 120.0, height: 75.0)
					.accessibility(label: Text("Subject: \(oracleViewModel.currentMythicCardViewModel.subject)"))
			}
			Spacer()
			VStack(alignment: .center) {
				Text("EVENT FOCUS")
					.multilineTextAlignment(.center)
					.frame(width: 120.0, height: 50.0)
					.accessibility(hidden: true)
				Text("\(oracleViewModel.currentMythicCardViewModel.eventFocus)")
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
					.frame(width: 120.0, height: 75.0)
					.accessibility(label: Text("EVENT FOCUS: \(oracleViewModel.currentMythicCardViewModel.eventFocus)"))
			}
			Spacer()
			VStack {
				Text("ACTION").frame(height: 50.0).accessibility(hidden: true)
				Text("\(oracleViewModel.currentMythicCardViewModel.action)")
					.fontWeight(.bold)
					.frame(width: 120.0, height: 75.0)
			}
		}
		.frame(width: 360.0)
    }
}

struct MythicTopView_Previews: PreviewProvider {
    static var previews: some View {
		MythicTopView(oracleViewModel: PreviewHelper.mockOracleWithDeckAndDrawnCard())
    }
}
