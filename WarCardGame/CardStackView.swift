//
//  CardStackView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 9/20/22.
//

import SwiftUI

struct CardStackView: View {
    var game: WarGameViewModel
    var deck: CardDeck
    var isPlayerDeck: Bool
    
    var body: some View {
        if deck.cards.count == 0 {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
        else {
            ZStack {
                //Card Stack
                ForEach(0..<deck.cards.count/5, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.red)
                            .padding(10.0)
                    }
                    .offset(x: 2.0*CGFloat(index), y: -2.0*CGFloat(index))
                    .aspectRatio(2/3, contentMode: .fit)
                }
                //Card Object
                if isPlayerDeck {
                    let card = deck.cards[0]
                    CardView(theme: game.theme, card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .offset(x: 2.0*CGFloat(deck.cards.count/5), y: -2.0*CGFloat(deck.cards.count/5))
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.5)) {
                                if game.cardsInPlay && game.draw {
                                    game.playTopCard()
                                }
                                else if !game.cardsInPlay && !game.draw {
                                    game.playTopCard()
                                }
                            }
                        }
                }
                else {
                    CardView(theme: game.theme, card: deck.cards[0])
                        .aspectRatio(2/3, contentMode: .fit)
                        .offset(x: 2.0*CGFloat(deck.cards.count/5), y: -2.0*CGFloat(deck.cards.count/5))
                }
            }
        }
        
    }
}


struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(game: WarGameViewModel(Theme(theme: "Classic"), 1), deck: CardDeck(theme: Theme(theme: "Classic"), numOfDecks: 1), isPlayerDeck: true)
    }
}
