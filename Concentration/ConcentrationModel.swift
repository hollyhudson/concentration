//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Holly Hudson on 18/07/2018.
//  Copyright © 2018 Holly Hudson. All rights reserved.
//

import Foundation

class Concentration
{
	// init an empty array of cards
	var cards = [Card]()
	
	func chooseCard(at index: Int) {
		if cards[index].isFaceUp {
			cards[index].isFaceUp = false
		} else {
			cards[index].isFaceUp = truej
		}
	}
	
	// create an initializer that controllers trying to instantiate the class will need to use
	init(numberOfPairsOfCards: Int) {
		for _ in 0..<numberOfPairsOfCards {
			let card = Card()
			// assigning makes a copy, which in this case is exactly what you want
			// this:
			// cards.append(card)
			// cards.append(card)
			// or this:
			cards += [card, card]
		}
		
		// TODO: shuffle the cards
	}
}
