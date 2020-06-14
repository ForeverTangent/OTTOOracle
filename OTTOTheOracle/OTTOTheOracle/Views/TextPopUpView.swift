//
//  TextPopUpView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/8/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct TextPopUpView: View {
	@State private var showPopover: Bool = false

	var displayedText: String
	var popUpText: String

	var body: some View {
		VStack {
			Text("\(displayedText)")
				.onTapGesture {
					self.showPopover = true
			}
			.popover(
				isPresented: self.$showPopover
			) {
				Text("\(self.popUpText)")
					.padding(.all, 30.0)
					.onTapGesture {
						self.showPopover = false
				}

			}
		}
	}
}


struct TextPopUpView_Previews: PreviewProvider {

	static var previews: some View {
		TextPopUpView(displayedText: "Displayed", popUpText: "Popup")
	}
}
