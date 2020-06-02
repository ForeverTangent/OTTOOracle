//
//  GMATopView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMATopView: View {
	var currentGMACard: GMACard
	
    var body: some View {
		HStack(alignment: .top) {
			VStack {
				Text("DIFFICULTY")
					.font(.system(size:10))
					.padding(.bottom, 5.0)
				Text("\(currentGMACard.difficulty)")
					.font(.system(size:14))
			}
			.padding(.leading)
			Spacer()
			VStack{
				Text("ODDS")
					.font(.system(size:10))
					.padding(.bottom, 5.0)
				HStack {
					Text("Bad")
						.font(.system(size:12))
						.padding(.leading)
					Spacer()
					Text("#")
						.font(.system(size:14))
						.padding(.trailing)
				}
				HStack {
					Text("Even")
						.font(.system(size:12))
						.padding(.leading)
					Spacer()
					Text("#")
						.font(.system(size:14))
						.padding(.trailing)
				}
				HStack {
					Text("Good")
						.font(.system(size:12))
						.padding(.leading)
					Spacer()
					Text("#")
						.font(.system(size:14))
						.padding(.trailing)
				}
			}
			Spacer()
			GMADiceView(currentGMACard: currentGMACard)
				.frame(width: 100.0, height: 100.0)
			Spacer()
			VStack{
				VStack {
					Text("RUNE")
						.font(.system(size:10))
						.padding(.bottom, 5.0)
					Text("#")
						.font(.system(size:14))
				}
				.padding(.bottom)
				VStack {
					Text("ELEMENT")
						.font(.system(size:10))
						.padding(.bottom, 5.0)
					Text("#")
						.font(.system(size:14))
				}
			}
			.padding(.trailing)
		}
    }
}

struct GMATopView_Previews: PreviewProvider {
    static var previews: some View {
		return Text("REPLACE ME.")
    }
}
