//
//  CardViews.swift
//  ConcentrationUI
//
//  Created by Christopher Slade on 6/20/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import SwiftUI

struct CardViews : View {
    var body: some View {
        VStack {
            HStack {
                CardView(card: Card())
                CardView(card: Card())
                CardView(card: Card())
                CardView(card: Card())
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
    }
}
#endif
