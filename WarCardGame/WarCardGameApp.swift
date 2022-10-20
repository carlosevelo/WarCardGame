//
//  WarCardGameApp.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 9/20/22.
//

import SwiftUI

@main
struct WarCardGameApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .task {
                    UserDefaults.standard.set(true, forKey: "soundEnabled")
                }
        }
    }
}
