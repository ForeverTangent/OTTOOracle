//
//  UNEGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct UNEGeneratorView: View {
	@ObservedObject var uneGeneratorViewModel = UNEGeneratorViewModel()

    var body: some View {
		TabView {
			UNEGeneratorCharacterView()
				.padding(.top, 100.0)
				.tabItem {
					Image(systemName: "1.square.fill")
					Text("Character")
			}
			UNEGeneratorInteractionView()
				.padding(.top, 30.0)
				.tabItem {
					Image(systemName: "2.square.fill")
					Text("Interaction")
			}

		}
		.navigationBarTitle("UNE", displayMode: .inline)
		.font(.headline)
    }
}


struct UNEGeneratorSubView: View {
	var title: String = ""
	@Binding var value: String

	var body: some View {
		VStack {
			Text("\(title)")
				.font(.subheadline)
				.multilineTextAlignment(.center)
				.frame(width: 300.0)
			Text("\(value)")
				.font(.title)
				.multilineTextAlignment(.center)
				.frame(width: 300.0)
		}
		.padding(.vertical, 5.0)
	}

}


struct UNEGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        UNEGeneratorView()
    }
}
