//
//  GMATagBottonView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMATagBottonView: View {
	var currentGMACard: GMACard

    var body: some View {
		VStack {
			HStack {
				Text("TAG1")
					.frame(width: 40.0)
					.font(.system(size:14))
				Spacer()
				Text("TAG2")
					.frame(width: 40.0)
					.font(.system(size:14))
				Spacer()
				Text("TAG3")
					.frame(width: 40.0)
					.font(.system(size:14))
				Spacer()
				Text("SCAT")
					.frame(width: 40.0)
					.font(.system(size:14))
			}
			.padding([.leading, .bottom, .trailing], 20.0)
			HStack() {
				Spacer()
				VStack(alignment: .center){
					Text("Belongings")
						.font(.subheadline)
						.padding(.bottom, 5.0)
					Text("VALUE")
						.font(.system(size:14))
					Spacer()
					Text("Catalyst")
						.font(.subheadline)
						.padding(.bottom, 5.0)
					Text("VALUE")
						.font(.system(size:14))
					Spacer()
					Text("Location")
						.font(.subheadline)
						.padding(.bottom, 5.0)
					Text("VALUE")
						.font(.system(size:14))
				}
				.padding(.horizontal, 30.0)
				Spacer()
				VStack(alignment: .center){
					Text("Names")
						.font(.subheadline)
						.padding(.bottom, 5.0)
					Text("VALUE")
						.font(.system(size:14))
					Text("VALUE")
						.font(.system(size:14))
					Text("VALUE")
						.font(.system(size:14))
					Spacer()
					Text("Virtue")
						.font(.subheadline)
						.padding(.bottom, 5.0)
					Text("VALUE")
						.font(.system(size:14))
					Spacer()
					Text("Vice")
						.font(.subheadline)
						.padding(.bottom, 5.0)
					Text("VALUE")
						.font(.system(size:14))
				}
				.padding(.horizontal, 30.0)
				Spacer()
			}
			.padding(.vertical, 10.0)
			.frame(height: 200.0)

		}
		.padding(.vertical, 5.0)
    }
}

struct GMATagBottonView_Previews: PreviewProvider {
    static var previews: some View {
		return Text("FIX ME")
    }
}
