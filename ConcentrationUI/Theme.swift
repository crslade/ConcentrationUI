//
//  Theme.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/18/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class Theme: BindableObject {
    
    var didChange = PassthroughSubject<Theme, Never>()
    
    static let originalEmojis = "🦇😱🙀😈🎃👻🍭🤖👽👾💀🤢"
    
    var emojis = Theme.originalEmojis
    
    var emoji = [Card:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojis.count > 0 {
            let randomStringIndex = emojis.index(emojis.startIndex, offsetBy: emojis.count.arc4Random)
            emoji[card] = String(emojis.remove(at: randomStringIndex))
        }
        //didChange.send(self)
        return emoji[card] ?? "?"
    }
    
    func resetEmojis() {
        emojis = Theme.originalEmojis
    }
}

extension Int {
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
