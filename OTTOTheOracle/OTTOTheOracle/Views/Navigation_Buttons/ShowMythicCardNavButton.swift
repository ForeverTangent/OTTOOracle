//
//  ShowMythicCardNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowMythicCardNavButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		NavigationLink(destination: MythicSimpleView().environmentObject(oracleViewModel)) {
			OTTOButton(buttonTitle: "Show Mythic Card")
		}
		.onAppear() {
			print("Showing Mythic Card")
			self.oracleViewModel.drawMythicCard()
		}
	}
}

struct ShowMythicCardNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowMythicCardNavButton().environmentObject(OracleViewModel())
    }
}
