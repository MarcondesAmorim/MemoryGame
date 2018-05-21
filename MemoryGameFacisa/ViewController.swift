//
//  ViewController.swift
//  MemoryGameFacisa
//
//  Created by Erisvaldo Junior on 18/05/2018.
//  Copyright © 2018 Facisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Game(numberOfPairsOfCards: cardButtons.count / 2)
    
    var clear = false
    
    @IBAction func touchCard(_ button: UIButton) {
        if let index = cardButtons.index(of: button) {
            flipCard(at: index)
            matchCards(at: index)
        }
    }
    
    
    func flipCard(at index: Int) {
        if clear {
            for i in 0...cardButtons.count-1 {
                cardButtons[i].setTitle("", for: .normal)
                cardButtons[i].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                game.cards[i].isFlip = false
            }
            clear = false
        }
        if !game.cards[index].isFlip {
            game.cards[index].isFlip = true
            cardButtons[index].setTitle(game.cards[index].emoji, for: .normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
      }
    
    func matchCards(at index: Int){
        var indexOtherCardFlip = -1
        for i in 0...game.cards.count-1{
            if (index != i){
                if game.cards[i].isFlip{
                    indexOtherCardFlip = i
                }
            }
        }
        if indexOtherCardFlip != -1 {
            if game.cards[index].identifier == game.cards[indexOtherCardFlip].identifier{
                cardButtons[index].isHidden = true
                cardButtons[indexOtherCardFlip].isHidden = true
            }else {
                clear = true
             }
            game.cards[index].isFlip = false
            game.cards[indexOtherCardFlip].isFlip = false
        }
    }
}

