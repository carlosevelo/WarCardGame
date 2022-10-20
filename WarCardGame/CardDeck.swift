//
//  CardDeck.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/7/22.
//

import Foundation

struct CardDeck {
    var cards: Array<Card>
    private(set) var theme: Theme
    
    init(theme: Theme) {
        self.cards = Array<Card>()
        self.theme = theme
    }
    
    init(theme: Theme, numOfDecks: Int = 1) {
        self.theme = theme
        cards = []
        var cardsTemp: Array<Card>
        
        for _ in 0..<numOfDecks {
            cardsTemp = Array<Card>()
            for i in 1..<14 {
                cardsTemp += [Card(suit: self.theme.symbol1, value: i), Card(suit: self.theme.symbol2, value: i), Card(suit: self.theme.symbol3, value: i), Card(suit: self.theme.symbol4, value: i)]
            }
            cards += cardsTemp
        }
        
    }
}
