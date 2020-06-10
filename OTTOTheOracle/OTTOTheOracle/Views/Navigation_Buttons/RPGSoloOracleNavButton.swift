//
//  RPGSoloOracleNavButton.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/10/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct RPGSoloOracleNavButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	
	var body: some View {
		NavigationLink(destination: RPGSoloOracleView().environmentObject(oracleViewModel)) {
			OTTOButton(buttonTitle: "Show RPG Solo Oracle")
		}
		.onAppear() {
			print("Showing RPG Solo Oracle")
		}

	}
}

struct RPGSoloOracleNavButton_Previews: PreviewProvider {
    static var previews: some View {
        RPGSoloOracleNavButton().environmentObject(OracleViewModel())
    }
}
