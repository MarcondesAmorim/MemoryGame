//
//  Game.swift
//  MemoryGameFacisa
//
//  Created by Erisvaldo Junior on 19/05/2018.
//  Copyright © 2018 Facisa. All rights reserved.
//

import Foundation
import GameKit

class Game {
    
    var cards = [Card]()
    var emojisToChoose = ["👺", "👻", "🎃", "🤖", "🐷", "🐹", "😸"]

    init(numberOfPairsOfCards: Int) {
        for identifier: Int in 1...numberOfPairsOfCards {
            var card = Card()
            card.identifier = identifier
            card.emoji = emojisToChoose.removeFirst();
            cards += [card,card]
        }
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
}
