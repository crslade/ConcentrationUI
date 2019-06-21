//
//  CardView.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import SwiftUI

struct CardView : View {
    var card: Card
    
    var body: some View {
        Button(action: {
            print("I'm pressed")
        }) {
            if card.isFaceUp {
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
                    .background(card.isMatched ? Color.clear : Color.blue)
                    .cornerRadius(3.0)
            }

            
        }
    }
}

#if DEBUG
struct CardView_Previews : PreviewProvider {
    static var previews: some View {
        var card1 = Card()
        var card2 = Card()
        var card3 = Card()
        card1.isFaceUp = true
        card2.isFaceUp = false
        card3.isMatched = true
        return Group {
            CardView(card: card1)
            CardView(card: card2)
            CardView(card: card3)
        }
        .previewLayout(.fixed(width: 75, height: 75))
        
    }
}
#endif
