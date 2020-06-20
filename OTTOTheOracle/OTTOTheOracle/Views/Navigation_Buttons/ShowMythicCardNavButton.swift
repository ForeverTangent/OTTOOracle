//
//  ShowMythicCardNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowMythicCardNavButton: View {
	var body: some View {
		NavigationLink(destination: MythicSimpleView()) {
			OTTOButton(buttonTitle: "Show Mythic Card")
		}
	}
}

struct ShowMythicCardNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowMythicCardNavButton().environmentObject(OracleViewModel())
    }
}
