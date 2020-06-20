//
//  UNEGeneratorInteractionView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct UNEGeneratorInteractionView: View {
	@ObservedObject var uneGeneratorViewModel = UNEGeneratorViewModel()

	@State private var relationshipStatus: Double = 1.0
	@State private var demeanor: Double = 1.0

	var body: some View {
		ScrollView {
			VStack {
				VStack(spacing: 10.0) {
					Text("Relationship Status")
					Text("\(UNE_NPC_RELATIONSHIP_STATUS.init(rawValue: Int(relationshipStatus))?.descriptionShort ?? "")")
						.font(.title)
					Slider(value: $relationshipStatus, in: 1...Double(UNE_NPC_RELATIONSHIP_STATUS.allCases.count-1), step: 1.0)
						.frame(width: 300.0)
					Text("Demeanor")
					Text("\(UNE_NPC_DEMEANOR.init(rawValue: Int(demeanor))?.descriptionShort ?? "")")
						.font(.title)
					Slider(value: $demeanor, in: 1...Double(UNE_NPC_DEMEANOR.allCases.count-1), step: 1.0)
						.frame(width: 300.0)
				}
				UNEGeneratorSubView(
					title: "Conversation Mood",
					value: $uneGeneratorViewModel.uneInteractionViewModel.conversationMood)
				UNEGeneratorSubView(
					title: "Bearing",
					value: $uneGeneratorViewModel.uneInteractionViewModel.bearing)
				UNEGeneratorSubView(
					title: "Focus",
					value: $uneGeneratorViewModel.uneInteractionViewModel.focus)
			}
			.padding(.vertical)
			Button("Calculate Interaction") {
				print("Calculate Interaction Pressed")
				self.uneGeneratorViewModel.getUNEInteractionFrom(
					relationshipStatus: UNE_NPC_RELATIONSHIP_STATUS.init(rawValue: Int(self.relationshipStatus)) ?? UNE_NPC_RELATIONSHIP_STATUS.NEUTRAL,
					andDemeanor: UNE_NPC_DEMEANOR.init(rawValue: Int(self.demeanor)) ?? UNE_NPC_DEMEANOR.FRIENDLY)
			}
			.onAppear() {
				print("Themes Tab Appears")
			}
			.padding(.vertical, 50.0)
			.foregroundColor(.blue)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 200.0, height: 50.0)
			)
		}
	}
}

struct UNEGeneratorInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        UNEGeneratorInteractionView()
    }
}
