//
//  OTTOBuildCharacterProtocol.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 7/18/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

protocol OTTOBuildCharacter {
	associatedtype CharacterType
	func buildNewCharacter() -> CharacterType
}
