//
//  ShowGMACardNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowGMACardNavButton: View {
	var body: some View {
		NavigationLink(destination: GMAMainView()) {
			OTTOButton(buttonTitle: "Show GMA Card")
		}
	}
}

struct ShowGMACardNavButton_Previews: PreviewProvider {
    static var previews: some View {
		ShowGMACardNavButton()
    }
}
