//
//  Array+Only.swift
//  Memorize
//
//  Created by Cai Xiyang on 2021/2/26.
//  Copyright © 2021 Cai Xiyang. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
