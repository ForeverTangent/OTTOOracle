//
//  String+GetTableDescriptionFormatted.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/22/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

extension String {
	func getEnumFormmatted() -> String {
		self.capitalized.replacingOccurrences(of: "_", with: " ")
	}
}
