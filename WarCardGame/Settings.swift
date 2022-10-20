//
//  Settings.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/13/22.
//

import SwiftUI

class Settings {
    @AppStorage(Key.soundEnabled) var soundEnabled: Bool = true
    @AppStorage(Key.highScore) var highScore: Double = 0
    
    var themeHighScores: [String : Any] = UserDefaults.standard.dictionary(forKey: Key.themeHighScores) ?? [:] {
        didSet {
            print("Saved high score")
            UserDefaults.standard.set(self.themeHighScores, forKey: Key.themeHighScores)
            print(self)
        }
    }

    func saveHighScore(_ score: Double, for themeName: String) {
        themeHighScores[themeName] = score
    }

    func highScore(for themeName: String) -> Double {
        Double(themeHighScores[themeName] as? String ?? "0") ?? 0
    }
    
    struct Key {
        static let soundEnabled = "soundEnabled"
        static let highScore = "highScore"
        static let themeHighScores = "themeHighScores"
    }
}
