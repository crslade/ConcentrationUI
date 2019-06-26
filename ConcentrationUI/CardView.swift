//
//  CardView.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import SwiftUI

struct CardView : View {
    @EnvironmentObject var game: Concentration
    var indexOfCard: Int
    
    var body: some View {
        Button(action: {
            self.game.chooseCard(at: self.indexOfCard)
        }) {
            if game.cards[indexOfCard].isFaceUp {
                Text("🏍")
                    .font(.largeTitle)
                    .padding()
                    .fixedSize()
                    .frame(width: 75, height: 75, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(3.0)
            } else {
                Text(" ")
                    .font(.largeTitle)
                    .padding()
                    .fixedSize()
                    .frame(width: 75, height: 75, alignment: .center)
                    .background(game.cards[indexOfCard].isMatched ? Color.clear : Color.blue)
                    .cornerRadius(3.0)
            }

            
        }
    }
}

#if DEBUG
struct CardView_Previews : PreviewProvider {
    static var previews: some View {
        let game = Concentration(numberOfPairsOfCards: 4)
        game.chooseCard(at: 0)
        game.chooseCard(at: 1)
        game.chooseCard(at: 2)
        return Group {
            CardView(indexOfCard: 0)
            CardView(indexOfCard: 2)
            CardView(indexOfCard: 3)
        }
        .previewLayout(.fixed(width: 75, height: 75))
        .environmentObject(game)
        
    }
}
#endif
