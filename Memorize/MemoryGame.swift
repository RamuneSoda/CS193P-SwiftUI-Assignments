//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var indexOfTheOneAndOnlyOneFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenCardIndex = cards.firstIndex(matching: card), !card.isFaceUp, !card.isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard { // One existed face-up-card
                if cards[potentialMatchIndex].content == cards[chosenCardIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenCardIndex].isMatched = true
                }
                cards[chosenCardIndex].isFaceUp = true // The chosen card turn face-up to show user it's matched or not.
            } else { // None existed face-up-card
                indexOfTheOneAndOnlyOneFaceUpCard = chosenCardIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
