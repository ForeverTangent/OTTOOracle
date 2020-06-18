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

	@State private var relationshipStatus: Double = 0.0
	@State private var demeanor: Double = 0.0

	var body: some View {
		ScrollView {
			VStack {
				VStack(spacing: 10.0) {
					Text("Relationship Status \(relationshipStatus, specifier: "%.0f")")
					Text("\(UNE_NPC_RELATIONSHIP_STATUS.getElementString(UNE_NPC_RELATIONSHIP_STATUS.init(rawValue: Int(relationshipStatus)) ?? .NONE))")
					Slider(value: $relationshipStatus, in: 0...Double(UNE_NPC_RELATIONSHIP_STATUS.allCases.count-1), step: 1.0)
						.frame(width: 300.0)
					Text("Demeanor \(demeanor, specifier: "%.0f")")
					Text("\(UNE_NPC_DEMEANOR.getElementString(UNE_NPC_DEMEANOR.init(rawValue: Int(demeanor)) ?? .NONE))")
					Slider(value: $demeanor, in: 1...Double(UNE_NPC_DEMEANOR.allCases.count-1), step: 1.0)
						.frame(width: 300.0)
				}
				UNEGeneratorSubView(
					title: "Relationship Status",
					value: $uneGeneratorViewModel.uneInteractionViewModel.relationshipStatus)
				UNEGeneratorSubView(
					title: "Conversation Mood",
					value: $uneGeneratorViewModel.uneInteractionViewModel.conversationMood)
				UNEGeneratorSubView(
					title: "Demeanor",
					value: $uneGeneratorViewModel.uneInteractionViewModel.demeanor)
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
				self.uneGeneratorViewModel.getRandomUNECharacter()
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
