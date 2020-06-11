//
//  ShowAdvMythicCardNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowAdvMythicCardNavButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		NavigationLink(destination: MythicAdvancedView().environmentObject(oracleViewModel)) {
			OTTOButton(buttonTitle: "Advanced Mythic Card")
		}
		.onAppear() {
			print("Showing Advanced Mythic Card")
			self.oracleViewModel.drawMythicCard()
		}
	}
}

struct ShowAdvMythicCardNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowAdvMythicCardNavButton().environmentObject(OracleViewModel())
    }
}
