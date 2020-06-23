//
//  PETGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/22/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct PETGeneratorView: View {
	@ObservedObject var petGeneratorViewModel = PETGeneratorViewModel()

    var body: some View {
		VStack(spacing: 10) {
			Text("Tags")

			Text("Focus Tags")
			Text("Seeds")
		}
    }
}

struct PETGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        PETGeneratorView()
    }
}
