//
//  GMADiceView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/30/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMADiceView: View {
	var body: some View {
		HStack(alignment: .center) {
			VStack(alignment: .center) {
				VStack {
					Text("D4")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
				VStack {
					Text("D10")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
				VStack {
					Text("D20")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
			}
			VStack(alignment: .center) {
				VStack {
					Text("D6")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
				VStack {
					Text("🔷")
						.font(.system(size:12))
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
				VStack {
					Text("10s")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
			}
			VStack(alignment: .center) {
				VStack {
					Text("D8")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
				VStack {
					Text("D12")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
				VStack {
					Text("1s")
						.font(.system(size:10))
						.fontWeight(.thin)
					Text("#")
						.fontWeight(.thin)
				}
				.frame(width: 20.0, height: 30.0)
			}
		}
		.frame(width: 90.0, height: 90.0)
	}
}

struct GMADiceView_Previews: PreviewProvider {
	static var previews: some View {
		GMADiceView()
			.previewLayout(.fixed(width: 70, height: 100))
	}

}
