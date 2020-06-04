//
//  MythicMidView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct MythicMidView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

    var body: some View {
		HStack {
			VStack {
				Text("EXCEPTIONAL").font(.subheadline).frame(width: 120.0, height: 100.0)
					.font(.system(size:10))
			}
			.frame(width: 100.0)
			.rotationEffect(.degrees(-90.0))
			Spacer()
			VStack {
				Text("RESULT")
					.font(.largeTitle)
					.fontWeight(.bold)
			}
			Spacer()
			VStack {
				Text("RANDOM")
				Text("#")
			}
			.frame(width: 100.0)
		}
		.frame(width: 360.0, height: 120.0)
    }
}

struct MythicMidView_Previews: PreviewProvider {
    static var previews: some View {
        MythicMidView()
    }
}
