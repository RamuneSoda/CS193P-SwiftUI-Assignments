//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/26.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import Foundation
import SwiftUI

struct MemoryGameTheme {
    var name: String
    var emojis: [String]
    var color: Color
    var numOfPairOfCard: Int
    
    init(name: String, emojis: [String], color: Color) {
        self.name = name
        self.emojis = emojis
        self.color = color
        self.numOfPairOfCard = Int.random(in: 1..<emojis.count)
    }
}

extension MemoryGameTheme {
    public static let HalloweenTheme = MemoryGameTheme(name: "Halloween", emojis: ["👻", "🎃", "🕸", "🧙‍♀️", "🍬", "🕷", "🍪"], color: Color.orange)
    public static let AnimalsTheme = MemoryGameTheme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🦊", "🐻", "🐷", "🐼"], color: Color.pink)
    public static let SportsTheme = MemoryGameTheme(name: "Sports", emojis: ["🏀", "🏈", "⚽️", "🎾", "🏐", "🏓", "🏸"], color: Color.gray)
    public static let PlantsTheme = MemoryGameTheme(name: "Plants", emojis: ["🌵", "🎄", "🌳", "🌴", "🌿", "☘️", "🍂"], color: Color.green)
    public static let FruitsTheme = MemoryGameTheme(name: "Fruits", emojis: ["🍎", "🍑", "🥭", "🥝", "🍍", "🍉", "🍒"], color: Color.red)
    public static let FlagsTheme = MemoryGameTheme(name: "Flags", emojis: ["🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🏳️", "🏁", "🏴‍☠️", "🏴"], color: Color.yellow)
}
