//
//  TextPopUpView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/8/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct TextPopUpView: View {
//	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Binding var showPopover: Bool
	var displayedText: String
	var popUpText: String

	var body: some View {
		Text("\(displayedText)")
			.font(.title)
			.fontWeight(.bold)
			.onLongPressGesture {
				self.showPopover = true
		}
		.popover(isPresented: $showPopover) {
			Text("\(self.popUpText)")
				.frame(width: 250.0)
				.onTapGesture {
					self.showPopover = false
			}
		}
	}
}

struct TextPopUpView_Previews: PreviewProvider {

	static var previews: some View {
		TextPopUpView(showPopover: .constant(true),
					  displayedText: "1",
					  popUpText: "Preview").environmentObject(PreviewHelper.mockOracleWithDeckAndDrawnCard())
	}
}
