//
//  Theme.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/6/22.
//

import Foundation
import SwiftUI

class Theme: Identifiable {
    private(set) var name: String
    private(set) var symbol1: String
    private(set) var symbol2: String
    private(set) var symbol3: String
    private(set) var symbol4: String
    private(set) var color: Color
    
    init(theme: String) {
        self.name = theme
        if theme == "Classic" {
            self.symbol1 = "♥️"
            self.symbol2 = "♦️"
            self.symbol3 = "♣️"
            self.symbol4 = "♠️"
            self.color = Color.red
        }
        else if theme == "Halloween" {
            self.symbol1 = "👻"
            self.symbol2 = "🎃"
            self.symbol3 = "🕷"
            self.symbol4 = "🦇"
            self.color = Color.orange
        }
        else if theme == "Christmas" {
            self.symbol1 = "🎄"
            self.symbol2 = "🎅🏽"
            self.symbol3 = "🎁"
            self.symbol4 = "⛄️"
            self.color = Color.green
        }
        else if theme == "Emoji" {
            self.symbol1 = "🤫"
            self.symbol2 = "🤔"
            self.symbol3 = "🫢"
            self.symbol4 = "🫣"
            self.color = Color.yellow
        }
        else if theme == "Monkey" {
            self.symbol1 = "🙈"
            self.symbol2 = "🙊"
            self.symbol3 = "🙉"
            self.symbol4 = "🐵"
            self.color = Color.brown
        }
        else {
            self.symbol1 = "♥️"
            self.symbol2 = "♦️"
            self.symbol3 = "♣️"
            self.symbol4 = "♠️"
            self.color = Color.red
        }
        
    }
}

let themes = [
    Theme(theme: "Classic"),
    Theme(theme: "Halloween"),
    Theme(theme: "Christmas"),
    Theme(theme: "Emoji"),
    Theme(theme: "Monkey")
]
