//
//  Card.swift
//  Concentration
//
//  Created by Holly Hudson on 18/07/2018.
//  Copyright © 2018 Holly Hudson. All rights reserved.
//

import Foundation

// This describes how the card behaves
// not how the card is displayed
struct Card
{
	var isFaceUp = false
	var isMatched = false
	var identifier: Int
	
	static var identifierFactory = 0
	
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	// You can do this:
	// init(externalName internalName: Type)
	//init(identifier id: Int) {
	//		identifier = id
	//}
	// or this:
	// init(identifier: Int) {
	//k	self.identifier = identifier
	//}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
