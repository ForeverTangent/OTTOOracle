//
//  ShowAdvMythicCardNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowAdvMythicCardNavButton: View {

	var body: some View {
		NavigationLink(destination: MythicAdvancedView()) {
			OTTOButton(buttonTitle: "Advanced Mythic Card")
		}
	}
}

struct ShowAdvMythicCardNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowAdvMythicCardNavButton().environmentObject(OracleViewModel())
    }
}
