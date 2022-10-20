//
//  PlayingAreaView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/6/22.
//

import SwiftUI

struct PlayingAreaView: View {
    var game: WarGameViewModel
    var cards: Array<Card>
    var playerCards: Bool
    
    var body: some View {
        ZStack {
            if cards.count > 0 {
                ForEach(0..<cards.count, id: \.self) { index in
                    let card = cards[index]
                    CardView(theme: game.theme, card: card)
                        .aspectRatio(CardAttributes.aspectRatio, contentMode: .fit)
                        .offset(x: 2.0*CGFloat(index), y: -2.0*CGFloat(index))
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.5)) {
                                if !game.draw {
                                    if game.playerWin {
                                        game.claimCards()
                                    }
                                    else {
                                        game.loseCards()
                                    }
                                }
                            }
                        }
                }
            }
            else {
                RoundedRectangle(cornerRadius: CardAttributes.cornerRadius)
                    .fill(.white)
                    .aspectRatio(CardAttributes.aspectRatio, contentMode: .fit)
            }
        }
        .padding([.top, .bottom], 10)
    }
    
    // MARK: - Drawing constants

    private struct CardAttributes {
        static let aspectRatio: Double = 2/3
        static let cornerRadius: Double = 10
        static let fontScaleFactor: CGFloat = 0.75
    }
}


struct PlayingAreaView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingAreaView(game: WarGameViewModel(Theme(theme: "Classic"), 1), cards: Array<Card>(), playerCards: true)
    }
}
