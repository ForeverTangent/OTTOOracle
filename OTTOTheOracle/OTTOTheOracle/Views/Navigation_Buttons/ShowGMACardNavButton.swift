//
//  ShowGMACardNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct ShowGMACardNavButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		NavigationLink(destination: GMAMainView().environmentObject(oracleViewModel)) {
			OTTOButton(buttonTitle: "Show GMA Card")
		}
		.onAppear() {
			print("Showing Mything Card")
			self.oracleViewModel.drawGMACard()
		}
	}
}

struct ShowGMACardNavButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowGMACardNavButton().environmentObject(OracleViewModel())
    }
}
