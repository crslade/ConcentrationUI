//
//  CardViews.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import SwiftUI

struct CardViews : View {
    @EnvironmentObject var game: Concentration
    
    var body: some View {
        VStack {
            HStack {
                CardView(indexOfCard: 0)
                CardView(indexOfCard: 1)
                CardView(indexOfCard: 2)
                CardView(indexOfCard: 3)
            }
//            HStack {
//                CardView(card: Card())
//                CardView(card: Card())
//                CardView(card: Card())
//                CardView(card: Card())
//            }
        }

    }
}

#if DEBUG
struct CardViews_Previews : PreviewProvider {
    static var previews: some View {
        CardViews()
            .environmentObject(Concentration(numberOfPairsOfCards: ConcentrationView.numberOfCards/2))
    }
}
#endif
