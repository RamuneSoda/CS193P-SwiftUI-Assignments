//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame(theme: MemoryGameTheme.FlagsTheme)
            ContentView(viewModel: game)
        }
    }
}
