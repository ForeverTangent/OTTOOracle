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
			VStack(alignment: .center, spacing: 40.0) {
				ShowRPGSoloOracleButton()
				ShowMythicCardButton()
				ShowGMACardButton()
			}.frame(height: 250.0)
				.navigationBarTitle("SOLO-RPG", displayMode: .inline)
		}.environmentObject(oracleManager)
	}
}

struct ShowRPGSoloOracleButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		NavigationLink(destination: RPGSoloOracleView()) {
			Text("Show RPG Solo Oracle")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		}
		.onAppear() {
			print("Showing RPG Solo Oracle")
		}

	}
}

struct ShowMythicCardButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel

	var body: some View {
		NavigationLink(destination: MythicMainView().environmentObject(oracleViewModel)) {
			Text("Show Mythic Card")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		}
		.onAppear() {
			print("Showing Mythic Card")
			self.oracleViewModel.drawMythicCard()
		}

	}
}

struct ShowGMACardButton: View {
	@EnvironmentObject var oracleViewModel: OracleViewModel
	@State private var showGMAModal = false

	var body: some View {
		NavigationLink(destination: GMAMainView().environmentObject(oracleViewModel)) {
			Text("Show GMA Card")
				.foregroundColor(.blue)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.blue, lineWidth: 5)
						.frame(width: 200.0, height: 50.0)
			)
		}
		.onAppear() {
			print("Showing Mything Card")
			self.oracleViewModel.drawGMACard()
		}

	}
}

//struct MythicMainView: View {
//	@EnvironmentObject var oracleViewModel: OracleViewModel
//	@Environment(\.presentationMode) var presentation
//
//	var body: some View {
//		VStack {
//			MythicCardView().environmentObject(oracleViewModel)
//			Button("Reload") {
//				self.oracleViewModel.drawMythicCard()
//			}
//			.foregroundColor(.blue)
//			.padding(75.0)
//			.overlay(
//				RoundedRectangle(cornerRadius: 20)
//					.stroke(Color.blue, lineWidth: 5)
//					.frame(width: 200.0, height: 50.0)
//			)
//		}
//		.frame(height: 500.0)
//	}
//}

//struct GMAMainView: View {
//	@EnvironmentObject var oracleViewModel: OracleViewModel
//	@Environment(\.presentationMode) var presentation
//
//	var body: some View {
//		ScrollView {
//			VStack {
//				GMACardView().environmentObject(oracleViewModel)
//				Button("Reload") {
//					self.oracleViewModel.drawGMACard()
//				}
//				.foregroundColor(.blue)
//				.padding(.top, 100.0)
//				.overlay(
//					RoundedRectangle(cornerRadius: 20)
//						.stroke(Color.blue, lineWidth: 5)
//						.frame(width: 200.0, height: 50.0)
//				)
//			}
//		}
//
//	}
//}


struct StartingView_Previews: PreviewProvider {
	static var previews: some View {
		StartingView().environmentObject(OracleViewModel())
	}
}
