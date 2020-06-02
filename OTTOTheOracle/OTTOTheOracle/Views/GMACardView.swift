//
//  GMACardView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct GMACardView: View {

	@ObservedObject var gmaCardViewModel = GMACardViewModel()

    var body: some View {
		Text("Hello")
    }
}

struct GMACardView_Previews: PreviewProvider {
    static var previews: some View {
		return GMACardView()
    }
}
