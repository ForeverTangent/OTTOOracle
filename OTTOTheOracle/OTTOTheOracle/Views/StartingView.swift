//
//  ContentView.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 5/29/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import SwiftUI

struct StartingView: View {
	@EnvironmentObject var oracleManager: OracleViewModel

	var body: some View {
		VStack {
			ShowMythicCardButton().environmentObject(oracleManager)
			Spacer()
			ShowGMACardButton().environmentObject(oracleManager)
		}.frame(height: 150.0)
		
	}
}


struct ShowMythicCardButton: View {
	@EnvironmentObject var oracleManager: OracleViewModel
	@State private var showMythicModal = false

	var body: some View {
		Button(action: {
			print("Showing Mything Model")
			self.oracleManager.drawMythicCard()
			self.showMythicModal = true
		}, label: {
			Text("Show Mythic Modal")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		})
			.sheet(isPresented: $showMythicModal,
				   onDismiss: {
					print("Dismissing Mthic Model")
			},
				   content: {
					MythicModalView(mythicCardViewModel:
						self.oracleManager.currentMythicCardViewModel).environmentObject(self.oracleManager)
			})
	}
}

struct ShowGMACardButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@State private var showGMAModal = false

	var body: some View {
		Button(action: {
			print("Showing GMA Model")
			self.oracleViewModel.drawGMACard()
			self.showGMAModal = true
		}, label: {
			Text("Show GMA Modal")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		})
			.sheet(isPresented: $showGMAModal,
				   onDismiss: {
					print("Dismissing GMA Model")
			},
				   content: {
					GMAModalView(gmaCardViewModel: GMACardViewModel(gmaCard: GMACard()) ).environmentObject(self.oracleViewModel)
			})
	}
}

struct MythicModalView: View {
	@EnvironmentObject var oracleManager: OracleViewModel
	@Environment(\.presentationMode) var presentation

	var mythicCardViewModel: MythicCardViewModel

	var body: some View {
		VStack {
			MythicCardView().environmentObject(oracleManager)
			Spacer()
			Button("Dismiss") {
				self.presentation.wrappedValue.dismiss()
			}
		}
		.frame(height: 500.0)
	}
}

struct GMAModalView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Environment(\.presentationMode) var presentation

	var gmaCardViewModel: GMACardViewModel

	var body: some View {
		VStack {
			Button("Dismiss") {
				self.presentation.wrappedValue.dismiss()
			}
			Spacer()
			GMACardView().environmentObject(oracleViewModel)

		}
		.frame(height: 500.0)
	}
}





struct StartingView_Previews: PreviewProvider {
	static var previews: some View {
		StartingView().environmentObject(OracleViewModel())
	}
}
