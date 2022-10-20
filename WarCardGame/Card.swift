//
//  Card.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 9/20/22.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var isInPlay: Bool
    var isPlayerCard: Bool
    var isWonByPlayer: Bool
    var isWonByOpponent: Bool
    var suit: String
    var value: CardValue
    
    public init(suit: String, value: Int) {
        self.isInPlay = false
        self.suit = suit
        self.value = CardValue(rawValue: value) ?? CardValue.Joker
        self.isPlayerCard = false
        self.isWonByPlayer = false
        self.isWonByOpponent = false
    }
    
    enum CardValue: Int {
        case Ace = 1
        case Two = 2
        case Three = 3
        case Four = 4
        case Five = 5
        case Six = 6
        case Seven = 7
        case Eight = 8
        case Nine = 9
        case Ten = 10
        case Jack = 11
        case Queen = 12
        case King = 13
        case Joker = 0
    }
    
}
