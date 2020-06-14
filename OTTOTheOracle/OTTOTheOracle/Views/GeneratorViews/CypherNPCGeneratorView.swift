//
//  CypherNPCGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/14/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct CypherNPCGeneratorView: View {
	@State var showingDetail = false

	var body: some View {
		Button(action: {
			self.showingDetail.toggle()
		}) {
			Text("Show Detail")
		}.sheet(isPresented: $showingDetail) {
			DetailView()
		}
	}
}

struct DetailView: View {
	var body: some View {
		Text("Detail")
	}
}

struct CypherNPCGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        CypherNPCGeneratorView()
    }
}
