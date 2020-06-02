//
//  ContentView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct StartingView: View {
	@EnvironmentObject var oracleManager: OracleManager
	@State private var showModal = false

	var body: some View {
		VStack {
			Button("Show modal") {
				print("Doing something")
				self.oracleManager.drawMythicCard()
				self.showModal = true
			}
		}.sheet(isPresented: $showModal,
				onDismiss: {
			print(self.showModal)
		}) {
			ModalView(mythicCard: self.oracleManager.currentMythicCard ).environmentObject(self.oracleManager)
		}
	}
}

struct ModalView: View {
	@EnvironmentObject var oracleManager: OracleManager
	@Environment(\.presentationMode) var presentation

//	let message: String
	@State var mythicCard: MYTHICCard

	var body: some View {
		VStack {
//			Text("\(message)")
			Text("\(mythicCard.cardFile)")
			Text("\(String(mythicCard.forward))")
			Button("Dismiss") {
				self.presentation.wrappedValue.dismiss()
			}
		}
	}
}

struct StartingView_Previews: PreviewProvider {
	@EnvironmentObject var oracleManager: OracleManager
    static var previews: some View {
		StartingView()
    }
}
