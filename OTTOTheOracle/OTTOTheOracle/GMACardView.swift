//
//  GMACardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMACardView: View {
	@EnvironmentObject var ottoOracle: OTTOOracle
    var body: some View {
		VStack {
			GMATopView()
				.padding(.top)
			GMADescriptionsView()
			GMATagBottonView()
		}
		.frame(width: 360.0, height: 500.0)
    }
}

struct GMACardView_Previews: PreviewProvider {
    static var previews: some View {
        GMACardView()
    }
}
