//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenCardIndex: Int = findIndex(of: card)
        cards[chosenCardIndex].isFaceUp = !cards[chosenCardIndex].isFaceUp
    }
    
    func findIndex(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return -1
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: 2 * pairIndex))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
