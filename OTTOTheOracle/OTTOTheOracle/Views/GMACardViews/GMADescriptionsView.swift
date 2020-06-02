//
//  GMADescriptionView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/31/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMADescriptionsView: View {
	var currentGMACard: GMACard

    var body: some View {
		VStack {
			HStack {
				Text("Description1")
					.font(.system(size:14))
					.padding(.leading)
				Spacer()
				Text("Description2")
					.font(.system(size:14))
					.padding(.horizontal, 5.0)
				Spacer()
				Text("Description3")
					.font(.system(size:14))
					.padding(.trailing)
			}
			.padding([.top, .leading, .trailing], 5.0)
			HStack() {
				VStack(alignment: .leading) {
					Text("Sound")
						.font(.subheadline)
						.frame(height: 30.0)
					Text("Sight")
						.font(.subheadline)
						.frame(height: 30.0)
					Text("Touch")
						.font(.subheadline)
						.frame(height: 30.0)
					Text("Smell")
						.font(.subheadline)
						.frame(height: 30.0)
				}
				.padding(.leading)
				.frame(width: 70.0)
				VStack(alignment: .leading) {
					Text("Description")
						.frame(height: 30.0)
						.font(.system(size:14))
					Text("Description")
						.frame(height: 30.0)
						.font(.system(size:14))
					Text("Description")
						.frame(height: 30.0)
						.font(.system(size:14))
					Text("Description")
						.frame(height: 30.0)
						.font(.system(size:14))
				}
				.padding(.trailing)
				.frame(width: 250.0)
			}
			.padding(.vertical, 5.0)
		}
    }
}

struct GMADescriptionView_Previews: PreviewProvider {
    static var previews: some View {
		return Text("REPLACE ME.")
    }
}
