//
//  Grid.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/26.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    var items: [Item]
    var itemView: (Item) -> ItemView
    var body: some View {
        GeometryReader { geometry in
            let layout = GridLayout(itemCount: items.count, nearAspectRatio: 1.0, in: geometry.size)
            ForEach(items.indices) { index in
                itemView(items[index])
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            }
        }
    }
}
