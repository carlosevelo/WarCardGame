//
//  CardView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 9/20/22.
//

import SwiftUI

struct CardView: View, Animatable {
    var theme: Theme
    var card: Card
    
    var isInPlay: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    
    init(theme: Theme, card: Card) {
        self.card = card
        rotation = card.isInPlay ? 0 : 180
        self.theme = theme
    }
    
    var body: some View {
        if isInPlay {
            ZStack {
                RoundedRectangle(cornerRadius: CardAttributes.cornerRadius)
                    .fill(.white)
                RoundedRectangle(cornerRadius: CardAttributes.cornerRadius)
                    .stroke()
                VStack {
                    Text(String(card.suit))
                    Text(String(card.value.rawValue))
                }
            }
            .aspectRatio(CardAttributes.aspectRatio, contentMode: .fit)
//                .offset(x: 0, y: card.isPlayerCard ? -180: 180)
            
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: CardAttributes.cornerRadius)
                    .fill(.white)
                RoundedRectangle(cornerRadius: CardAttributes.cornerRadius)
                    .stroke()
                RoundedRectangle(cornerRadius: CardAttributes.cornerRadius)
                    .fill(theme.color)
                    .padding(10.0)
            }
            .aspectRatio(CardAttributes.aspectRatio, contentMode: .fit)
        }
        
//        .rotation3DEffect(Angle.degrees(rotation), axis: (x: 0, y: 1, z: 0))
    }
        
    
    // MARK: - Drawing constants

    private struct CardAttributes {
        static let aspectRatio: Double = 2/3
        static let cornerRadius: Double = 10
        static let fontScaleFactor: CGFloat = 0.75
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(theme: Theme(theme: "Classic"), card: Card(suit: "♥️", value: 11))
    }
}
