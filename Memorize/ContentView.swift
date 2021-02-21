//
//  ContentView.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards.shuffled()) { card in
                CardView(card: card).onTapGesture{
                    viewModel.choose(card: card)
                }.aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count >= 5 ? .title : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView(viewModel: EmojiMemoryGame())
//            .preferredColorScheme(.dark)
        
    }
}
