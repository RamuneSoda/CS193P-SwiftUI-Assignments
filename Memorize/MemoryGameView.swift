//
//  ContentView.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            Text(viewModel.theme.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Score: \(viewModel.scores)")
                .font(.headline)
            
            
            Grid(items: viewModel.cards) {card in // 为什么这里的Grid声明时不需要说明范型，即Grid<viewModel.Card, CardView>?
                CardView(card: card).onTapGesture{
                    viewModel.choose(card: card)
                }
                .padding()
            }
            .foregroundColor(viewModel.theme.color)
            
            Button("New Game", action: viewModel.createNewGame)
        }
        .padding()
        
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cournerRadius).stroke(lineWidth: lineWidth)
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: 10)
//                            .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]),
//                                                 startPoint: .topLeading,
//                                                 endPoint: .bottom))
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScale ))
        }
    }
    
    // MARK: Drawing Constant

    let cournerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 2.0
    let fontScale: CGFloat = 0.75
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame(theme: MemoryGameTheme.AnimalsTheme))
        
    }
}
