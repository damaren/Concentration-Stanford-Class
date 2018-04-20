//
//  Concentration.swift
//  Concentration Stanford Class
//
//  Created by damaren on 16/04/2018.
//  Copyright © 2018 damaren. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        cards = shuffle(cardsArray: cards)
    }
    
    func shuffle(cardsArray orderedInput: Array<Card>) -> Array<Card> {
        var ordered = orderedInput
        var shuffled = Array<Card>()
        for _ in 0..<ordered.count {
            let randomIndex = Int(arc4random_uniform(UInt32(ordered.count)))
            shuffled.append(ordered[randomIndex])
            ordered.remove(at: randomIndex)
        }
        return shuffled
    }
    
}
