//
//  MythicTopView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicTopView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

    var body: some View {
		HStack {
			VStack {
				Text("SUBJECT")
				Text("#")
			}
			.frame(width: 100.0)
			Spacer()
			VStack {
				Text("EVENT FOCUS")
				Text("#")
			}
			Spacer()
			VStack {
				Text("ACTION")
				Text("#")
			}
			.frame(width: 100.0)
		}
		.frame(width: 360.0)
    }
}

struct MythicTopView_Previews: PreviewProvider {
    static var previews: some View {
        MythicTopView()
    }
}
