//
//  WarGameMainView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 9/20/22.
//

import SwiftUI
import Foundation

struct WarGameMainView: View {
    var settings: Settings
    @ObservedObject var game: WarGameViewModel
    @State private var animatedTimeRemaining = 0.0
    @State private var scoreTimer: TimeInterval = 0.0
    let formatter = DateComponentsFormatter()
    
    var body: some View {
        if game.isDealt {
            if (game.gameIsWon) {
                VStack {
                    Text("You won!")
                        .font(.title)
                    Text("Score: " + String(formatter.string(from: game.score) ?? ""))
                        .font(.title3 )
                    if game.score > game.themeHighScore {
                        Text("That's a new high score!")
                            .task {
                                UserDefaults.standard.set(game.score, forKey: game.theme.name)
                            }
                    }
                }
                .task() {
                    sleep(3)
                    game.newGame()
                }
            }
            else if (game.gameIsLost) {
                Text("You lost!")
                    .font(.title)
            }
            else {
                GeometryReader() { viewGeo in
                    VStack {
                        //Opponent Side
                        Text(String("Cards: " + String(game.opponentDeck.cards.count)))
                            .padding(.bottom, 5)
                            .frame(width: viewGeo.size.width, height: viewGeo.size.height * 0.03, alignment: .center)
                        CardStackView(game: game, deck: game.opponentDeck, isPlayerDeck: false)
                            .zIndex(1)
                            .frame(width: viewGeo.size.width, height: viewGeo.size.height * 0.20, alignment: .center)
                        PlayingAreaView(game: game, cards: game.opponentCardsInPlay, playerCards: false)
                            .frame(width: viewGeo.size.width, height: viewGeo.size.height * 0.19, alignment: .center)
                        
                        //Middle
                        GeometryReader() { middleGeo in
                            HStack {
                                Spacer()
                                if game.penalty {
                                    VStack {
                                        Text("Too Slow!")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .frame(width: middleGeo.size.width * 0.45, height: middleGeo.size.height * 0.5, alignment: .center)
                                        Text("Draw Again")
                                            .fontWeight(.bold)
                                            .frame(width: middleGeo.size.width * 0.45, height: middleGeo.size.height * 0.5, alignment: .center)
                                    }
                                    .onAppear() {
                                        game.enforcePenalty()
                                    }
                                }
                                else {
                                    VStack {
                                        Text(game.battleResults)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .frame(width: middleGeo.size.width * 0.45, height: middleGeo.size.height * 0.5, alignment: .center)
                                        Text(game.battleResultsInfo)
                                            .fontWeight(.bold)
                                            .frame(width: middleGeo.size.width * 0.45, height: middleGeo.size.height * 0.5, alignment: .center)
                                    }
                                }
                                if (game.playerWin && game.cardsInPlay) {
                                    TimerView(
                                        startAngle: angle(for: 0),
                                        endAngle: angle(for: -animatedTimeRemaining)
                                    )
                                    .onAppear {
                                        animatedTimeRemaining = game.timerTimeRemaining
                                        withAnimation(.linear(duration: game.timerTimeRemaining)) {
                                            animatedTimeRemaining = 0
                                        }
                                    }
                                    .frame(width: middleGeo.size.width * 0.25, height: middleGeo.size.height, alignment: .trailing)
                                }
                                else {
                                    Spacer()
                                }
                                
                            }
                        }
                        .frame(width: viewGeo.size.width, height: viewGeo.size.height * 0.08, alignment: .center)
                        
                        //Player Side
                        PlayingAreaView(game: game, cards: game.playerCardsInPlay, playerCards: true)
                            .zIndex(0)
                            .frame(width: viewGeo.size.width, height: viewGeo.size.height * 0.19, alignment: .center)
                        GeometryReader() { playerGeo in
                            HStack {
                                VStack {
                                    Text("Score:\n" + String(formatter.string(from: scoreTimer) ?? ""))
                                        .onReceive(game.timer) { _ in
                                            game.currentScore += 1
                                            scoreTimer = game.currentScore
                                        }
                                        .frame(width: playerGeo.size.width * 0.32, height: playerGeo.size.height * 0.5, alignment: .leading)
                                    Text("High Score:\n" + String(formatter.string(from: game.themeHighScore) ?? ""))
                                        .frame(width: playerGeo.size.width * 0.32, height: playerGeo.size.height * 0.5, alignment: .leading)
                                }
                                .frame(width: playerGeo.size.width * 0.32, height: playerGeo.size.height, alignment: .center)
                                CardStackView(game: game, deck: game.playerDeck, isPlayerDeck: true)
                                    .frame(width: playerGeo.size.width * 0.32, height: playerGeo.size.height, alignment: .center)
                                if game.showPowerUp {
                                    Button("Steal!") {
                                        game.stealCards()
                                    }
                                    .buttonStyle(RoundedRectangleButtonStyle(color: game.theme.color))
                                    .frame(width: playerGeo.size.width * 0.32, height: playerGeo.size.height * 0.5, alignment: .center)
                                }
                                else {
                                    Spacer()
                                }
                            }
                        }
                        .frame(width: viewGeo.size.width, height: viewGeo.size.height * 0.20, alignment: .center)
                        HStack {
                            Button("New Game") {
                                game.newGame()
                            }
                            .frame(width: viewGeo.size.width * 0.33, height: viewGeo.size.height * 0.03, alignment: .center)
                            Text("Cards: " + String(game.playerDeck.cards.count))
                                .frame(width: viewGeo.size.width * 0.33, height: viewGeo.size.height * 0.03, alignment: .center)
                            Spacer()
                        }
                        
                    }
                }
                .padding([.leading, .trailing], 10)
            }
        }
        else {
            VStack {
                CardStackView(game: game, deck: game.mainDeck, isPlayerDeck: false)
                    .padding(100)
                    .onTapGesture {
                        game.deal()
                    }
                Text("Tap the Deck to Deal!")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
        }
    }
    
    
    // MARK: - Helpers
    
    private func angle(for percentOfCircle: Double) -> Angle {
        Angle.degrees(percentOfCircle * 360 - 90)
    }
    
    private struct RoundedRectangleButtonStyle: ButtonStyle {
        private var color: Color
        init(color: Color) {
            self.color = color
        }
        func makeBody(configuration: Configuration) -> some View {
            HStack {
              Spacer()
                configuration.label
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)
              Spacer()
            }
            .padding()
            .background(self.color.cornerRadius(8))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
        }
    }
}

struct WarGameMainView_Previews: PreviewProvider {
    static var previews: some View {
        WarGameMainView(settings: Settings(), game: WarGameViewModel(Theme(theme: "Classic"), 1))
    }
}
