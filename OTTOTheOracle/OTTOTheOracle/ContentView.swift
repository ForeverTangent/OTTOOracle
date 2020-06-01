//
//  ContentView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
		VStack {
			Text("Hello, World!")
			Button(action: {}) {
				Text("Hello, World!")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
