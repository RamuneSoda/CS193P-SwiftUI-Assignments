//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    var theme: MemoryGameTheme
    
    init(theme: MemoryGameTheme) {
        self.theme = theme
        self.model = Self.createMemoryGame(theme: theme)
    }
    
    static func createMemoryGame (theme: MemoryGameTheme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numOfPairOfCard) { indexOfPair in theme.emojis[indexOfPair] }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func createNewGame() {
        self.model = Self.createMemoryGame(theme: theme)
    }
}
