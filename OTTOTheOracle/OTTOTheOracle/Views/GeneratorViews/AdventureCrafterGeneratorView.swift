//
//  AdventureCrafterGeneratorView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/12/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct AdventureCrafterGeneratorView: View {
	@ObservedObject var acViewModel = AdventureCrafterViewModel()

    var body: some View {
		Group {
			ScrollView {
				ForEach(self.acViewModel.plotPoints) { (plotPoint) in
					Text("\(plotPoint.priority) \(plotPoint.title)")
						.font(.title)
						.multilineTextAlignment(.center)
				}
			}
			.padding(.top, 200.0)
		}
	}
}

struct AdventureCrafterGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        AdventureCrafterGeneratorView(acViewModel: AdventureCrafterViewModel())
    }
}
