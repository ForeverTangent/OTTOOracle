//
//  ContentView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct StartingView: View {
	@State var showingPopover = false

	var body: some View {
		Button(action: {
			self.showingPopover = true
		}) {
			Text("Show new view")
		}.popover(isPresented: $showingPopover){
			HStack {
				Text("New Popover")
			}.frame(width: 500, height: 500)
				.background(Color.red)
		}
	}
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
