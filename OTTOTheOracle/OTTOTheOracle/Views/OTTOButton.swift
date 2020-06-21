//
//  OTTOButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct OTTOButton: View {
	var buttonTitle: String
	var body: some View {
		Text("\(buttonTitle)")
			.foregroundColor(.blue)
			.padding()
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
		)
	}
}

struct OTTOButton_Previews: PreviewProvider {
    static var previews: some View {
		OTTOButton(buttonTitle: "TEST")
    }
}
