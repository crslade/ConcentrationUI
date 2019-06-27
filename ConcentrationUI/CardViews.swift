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
            HStack {
                CardView(indexOfCard: 4)
                CardView(indexOfCard: 5)
                CardView(indexOfCard: 6)
                CardView(indexOfCard: 7)
            }
            HStack {
                CardView(indexOfCard: 8)
                CardView(indexOfCard: 9)
                CardView(indexOfCard: 10)
                CardView(indexOfCard: 11)
            }
            HStack {
                CardView(indexOfCard: 12)
                CardView(indexOfCard: 13)
                CardView(indexOfCard: 14)
                CardView(indexOfCard: 15)
            }
            HStack {
                CardView(indexOfCard: 16)
                CardView(indexOfCard: 17)
                CardView(indexOfCard: 18)
                CardView(indexOfCard: 19)
            }
            HStack {
                CardView(indexOfCard: 20)
                CardView(indexOfCard: 21)
                CardView(indexOfCard: 22)
                CardView(indexOfCard: 23)
            }
        }

    }
}

#if DEBUG
struct CardViews_Previews : PreviewProvider {
    static var previews: some View {
        CardViews()
            .environmentObject(Concentration(numberOfPairsOfCards: ConcentrationView.numberOfCards/2))
            .environmentObject(Theme())
    }
}
#endif
