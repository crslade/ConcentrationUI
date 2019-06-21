//
//  ConcentrationView.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import SwiftUI

struct ConcentrationView : View {
    @State var game = Concentration(numberOfPairsOfCards: 2)
    
    var body: some View {
        VStack {
            CardViews()
            HStack {
                Text("Score: \(game.score)")
                Spacer()
                Button(action: {
                    print("New Game")
                    self.game.chooseCard(at: 0)
                    self.game.chooseCard(at: 1)
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
    }
}
#endif
