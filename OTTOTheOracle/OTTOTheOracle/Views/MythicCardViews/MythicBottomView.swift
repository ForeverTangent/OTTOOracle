//
//  MythicBottomView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicBottomView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		VStack {
			HStack {
				Text("SCENE SETUP:")
				.frame(width: 130.0)
				Spacer()
				Text("EVENT FOCUS")
				Spacer()
				Text("ACTION")
				.frame(width: 100.0)
			}
			.frame(width: 360.0)
			HStack {
				Text("#")
					.frame(width: 100.0)
				Spacer()
				Text("DESCRIPTION")
				Spacer()
				Text("#")
					.frame(width: 100.0)
			}
			.frame(width: 360.0)
		}

	}
}

struct MythicBottomView_Previews: PreviewProvider {
    static var previews: some View {
        MythicBottomView()
    }
}
