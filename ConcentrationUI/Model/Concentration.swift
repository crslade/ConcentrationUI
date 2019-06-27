//
//  Concentration.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class Concentration: BindableObject {
    
    var didChange = PassthroughSubject<Concentration, Never>()
    
    private var numberOfPairsOfCards: Int
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var score = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): choose index not in cards")
        if !cards[index].isMatched {
            flipCount += 1
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                // check is cards match
                if cards[matchedIndex] == cards[index] {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if cards[matchedIndex].hasBeenFliped {
                        score -= 1
                    }
                    if cards[index].hasBeenFliped {
                        score -= 1
                    }
                    cards[index].hasBeenFliped = true
                    cards[matchedIndex].hasBeenFliped = true
                }
                cards[index].isFaceUp = true
            } else {
                //no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        didChange.send(self)
    }
    
    func newGame() {
        cards = [Card]()
        createDeck()
        score = 0
        print("Created New Game")
        didChange.send(self)
    }
    
    private func createDeck() {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "init( \(numberOfPairsOfCards): needs to be > 0")
        self.numberOfPairsOfCards = numberOfPairsOfCards
        createDeck()
    }  
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

