//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/26.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
