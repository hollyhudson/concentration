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
    
    // you do not have to be this explicit:
    // var emojiChoices: Array<String> = ["🦑", "🐠", "🦀", "🐳"]
    var emojiChoices: Array<String> = ["🦑", "🐠", "🦀", "🐳"]
    
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
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Chosen card was not in cardButtons")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("in flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.7708204842, green: 0.8249951159, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

