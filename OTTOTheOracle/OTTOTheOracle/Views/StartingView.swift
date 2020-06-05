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
		NavigationView {
			VStack {
				ShowMythicCardButton()
					.navigationBarTitle("SOLO-RPG")
				Spacer()
				ShowGMACardButton().environmentObject(oracleManager)
			}.frame(height: 150.0)
		}.environmentObject(oracleManager)
	}
}


struct ShowMythicCardButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@State private var showMythicModal = false

	var body: some View {
		NavigationLink(destination: MythicMainView()) {
			Text("Show Mythic Modal")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		}
		.onAppear() {
			print("Showing Mything Model")
			self.oracleViewModel.drawMythicCard()
		}

	}
}

struct ShowGMACardButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@State private var showGMAModal = false

	var body: some View {
		NavigationLink(destination: GMAMainView()) {
			Text("Show GMA Modal")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		}
		.onAppear() {
			print("Showing Mything Model")
			self.oracleViewModel.drawGMACard()
		}

	}
}


struct MythicMainView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Environment(\.presentationMode) var presentation

	var body: some View {
		VStack {
			MythicCardView().environmentObject(oracleViewModel)
			Spacer()
			Button("Reload") {
				self.oracleViewModel.drawMythicCard()
			}
		}
		.frame(height: 500.0)
	}
}

struct GMAMainView: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@Environment(\.presentationMode) var presentation

	var body: some View {
		ScrollView {
			VStack {
				GMACardView().environmentObject(oracleViewModel)
				Button("Reload") {
					self.oracleViewModel.drawGMACard()
				}
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
				)
			}
		}

	}
}





struct StartingView_Previews: PreviewProvider {
	static var previews: some View {
		StartingView().environmentObject(OracleViewModel())
	}
}