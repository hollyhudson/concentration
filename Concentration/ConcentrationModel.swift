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
	var indexOfOnlyFaceUpCard: Int?
	
	func chooseCard(at index: Int) {
		// TODO: add condition of only 2 cards left and they match (won game)
		
		// ignore attempts to choose a card that is already matched
		if cards[index].isMatched {
			return
		}
		
		if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
			// check if cards match
			if cards[matchIndex].identifier == cards[index].identifier {
				cards[matchIndex].isMatched = true
				cards[index].isMatched = true
			}
			// flip the newly selected card, now there are 2 cards faceUp
			cards[index].isFaceUp = true
			indexOfOnlyFaceUpCard = nil
		} else {
			// either 2 or 0 cards are faceUp (so make them all faceDown first in case it's 2
			for flipDownIndex in cards.indices {
				cards[flipDownIndex].isFaceUp = false
			}
			// and flip the user-chosen card up
			cards[index].isFaceUp = true
			indexOfOnlyFaceUpCard = index
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
