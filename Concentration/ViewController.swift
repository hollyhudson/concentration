//
//  ViewController.swift
//  Concentration
//
//  Created by Holly on 18.6.8.
//  Copyright © 2018 Holly Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
	// create an instance of the Concentration class, and init it
	lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
	
    // instance variable
    // Swift is a strongly typed language, but it also has strong type inference
    // var flipCount: Int = 0  so technically this is the way to fully declare and initialize this variable
    // but in practice Swift will infer Int just from the following:
    var flipCount = 0 {
        didSet {
            // This is a property observer
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    // An outlet creates an instance variable, which doesn't need to be initialized
    // The exclamation point means ...
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // Brackets indicate an array
    // cmd-click to edit a variable to rename it everywhere
    @IBOutlet var cardButtons: [UIButton]!
    
    // @IBAction refers to that circle where the line number should be
    // each argument has 2 names (external and internal)
    // return values func name() -> Int
    // _ means "no argument", which is almost never done in Swift
    @IBAction func touchCard(_ sender: UIButton) {
       
        print("arrrr, a squid!")
        flipCount += 1
        // let is a const
        // putting an exclamation indicates to assume the optional is set (and your app will crash if it isn't)
        // let cardNumber = cardButtons.index(of: sender)!
        // or you can wrap it in an if so the action only happens if the variable is set, to prevent your app from crashing
        if let cardNumber = cardButtons.index(of: sender) {
			game.chooseCard(at: cardNumber)
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
			updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons")
        }
    }
	
	func updateViewFromModel() {
		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(emoji(for: card), for: UIControlState.normal)
				button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
			} else {
				button.setTitle("", for: UIControlState.normal)
				button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.8850428462, green: 0.822701931, blue: 1, alpha: 1)
			}
			
		}
	}
	
	var emojiChoices = ["🦑", "🐠", "🦀", "🐳"]
	
	// create an empty dictionary
	// var emoji = Dictionary<Int,String>()
	var emoji = [Int:String]()
	
	// looking something up in a dictionary returns an optional
	func emoji(for card: Card) -> String {
		// This is a nested if, implemented with comma-separated conditions
		// If both conditions are true, the code is executed
		if emoji[card.identifier] == nil, emojiChoices.count > 0 {
				let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
				emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
		}
		return emoji[card.identifier] ?? "?"
	}
}

