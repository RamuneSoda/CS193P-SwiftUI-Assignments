//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕸", "🧙‍♀️", "🍬", "🕷", "🍩", "🥖", "🎄", "🥩", "🕯", "🍺"].shuffled()
        // 为什么不直接将数组传进MemoryGame的init中，让init自己生成内容？
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { indexOfPair in emojis[indexOfPair] }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    
}
