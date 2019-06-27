//
//  ConcentrationView.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import SwiftUI

struct ConcentrationView : View {
    @EnvironmentObject var game: Concentration
    
    static let numberOfCards = 24
    
    var body: some View {
        VStack {
            CardViews()
            HStack {
                Text("Score: \(game.score)")
                Spacer()
                Button(action: {
                    print("New Game")
                    self.game.newGame()
                    
                }) {
                    Text("New Game")
                }
            }
            .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ConcentrationView()
            .environmentObject(Concentration(numberOfPairsOfCards: ConcentrationView.numberOfCards/2))
            .environmentObject(Theme())
    }
}
#endif
