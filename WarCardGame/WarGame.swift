//
//  WarGame.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 9/20/22.
//

import Foundation

struct WarGame {
    private(set) var mainDeck: CardDeck
    private var numOfDecks: Int
    var isDealt: Bool
    var playerDeck: CardDeck
    var playerCardsInPlay = Array<Card>()
    var opponentDeck: CardDeck
    var opponentCardsInPlay = Array<Card>()
    var playerWin: Bool
    var draw: Bool
    var cardsInPlay: Bool
    var gameIsWon: Bool
    var gameIsLost: Bool
    var score: TimeInterval
    
    init(numOfDecks: Int, theme: Theme) {
        self.numOfDecks = numOfDecks
        self.mainDeck = CardDeck(theme: theme, numOfDecks: numOfDecks)
        self.mainDeck.cards.shuffle()
        self.isDealt = false
        self.playerDeck = CardDeck(theme: theme)
        self.opponentDeck = CardDeck(theme: theme)
        self.playerWin = false
        self.draw = false
        self.cardsInPlay = false
        self.gameIsWon = false
        self.gameIsLost = false
        self.score = 0.0
        //deal();
    }
    
    mutating func enforcePenalty() {
        for i in 0..<opponentCardsInPlay.count {
            opponentCardsInPlay[i].isInPlay.toggle()
            opponentCardsInPlay[i].isPlayerCard = false
            opponentDeck.cards.append(opponentCardsInPlay[i])
        }
        for i in 0..<playerCardsInPlay.count {
            playerCardsInPlay[i].isInPlay.toggle()
            playerCardsInPlay[i].isPlayerCard = false
            opponentDeck.cards.append(playerCardsInPlay[i])
        }
        opponentCardsInPlay.removeAll()
        playerCardsInPlay.removeAll()
        
        cardsInPlay = false
    }
    
    mutating func deal() {
        for i in 0..<mainDeck.cards.count {
            if (i % 2 == 0) {
                mainDeck.cards[i].isPlayerCard = true
                playerDeck.cards.append(mainDeck.cards[i])
            }
            else {
                mainDeck.cards[i].isPlayerCard = false
                opponentDeck.cards.append(mainDeck.cards[i])
            }
        }
        self.isDealt.toggle()
    }
    
    mutating func playTopCard() {
        playerDeck.cards[0].isInPlay.toggle()
        playerCardsInPlay.append(playerDeck.cards[0])
        let playerCard = playerDeck.cards[0]
        playerDeck.cards.remove(at: 0)
        
        opponentDeck.cards[0].isInPlay.toggle()
        opponentCardsInPlay.append(opponentDeck.cards[0])
        let opponentCard = opponentDeck.cards[0]
        opponentDeck.cards.remove(at: 0)
        
        cardsInPlay = true
        
        if playerCard.value.rawValue > opponentCard.value.rawValue {
            playerWin = true
            draw = false
        }
        else if playerCard.value.rawValue < opponentCard.value.rawValue {
            playerWin = false
            draw = false
        }
        else {
            playerWin = false
            draw = true
        }
    }
    
    mutating func claimCards() {
        for i in 0..<opponentCardsInPlay.count {
            opponentCardsInPlay[i].isInPlay.toggle()
            opponentCardsInPlay[i].isPlayerCard = true
            playerDeck.cards.append(opponentCardsInPlay[i])
        }
        for i in 0..<playerCardsInPlay.count {
            playerCardsInPlay[i].isInPlay.toggle()
            playerCardsInPlay[i].isPlayerCard = true
            playerDeck.cards.append(playerCardsInPlay[i])
        }
        opponentCardsInPlay.removeAll()
        playerCardsInPlay.removeAll()
        cardsInPlay = false
    }
    
    mutating func loseCards() {
        for i in 0..<opponentCardsInPlay.count {
            opponentCardsInPlay[i].isInPlay.toggle()
            opponentCardsInPlay[i].isPlayerCard = false
            opponentDeck.cards.append(opponentCardsInPlay[i])
        }
        for i in 0..<playerCardsInPlay.count {
            playerCardsInPlay[i].isInPlay.toggle()
            playerCardsInPlay[i].isPlayerCard = false
            opponentDeck.cards.append(playerCardsInPlay[i])
        }
        opponentCardsInPlay.removeAll()
        playerCardsInPlay.removeAll()
        cardsInPlay = false
    }
    
    mutating func stealCards() {
        
    }
}
