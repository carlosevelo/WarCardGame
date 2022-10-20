//
//  HomeView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/8/22.
//

import SwiftUI

struct HomeView: View {
    var settings = Settings()
    @State var numOfDecks = 0
    @AppStorage(Settings.Key.soundEnabled) var soundEnabled: Bool = true {
        didSet {
            UserDefaults.standard.set(self.soundEnabled, forKey: "soundEnabled")
        }
    }
    let formatter = DateComponentsFormatter()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("1 Deck")) {
                    ForEach(themes) { theme in
                        NavigationLink(theme.name) {
                            WarGameMainView(settings: settings, game: WarGameViewModel(theme, 1))
                                .navigationTitle(theme.name + " War!")
                        }
                    }
                }
                .navigationTitle("Game of War!")
                
                Section(header: Text("2 Decks")) {
                    ForEach(themes) { theme in
                        NavigationLink(theme.name) {
                            WarGameMainView(settings: settings, game: WarGameViewModel(theme, 2))
                                .navigationTitle(theme.name + "War!")
                        }
                    }
                }
                Section(header: Text("Settings")) {
                    Toggle("Sound", isOn: $soundEnabled)
                        .onTapGesture {
                            settings.soundEnabled.toggle()
                        }
                        .padding(.horizontal)
                }
                Section(header: Text("High Scores")) {
                    ForEach(themes) { theme in
                        let highScore = String(formatter.string(from: UserDefaults.standard.double(forKey: theme.name)) ?? "")
                        Text(theme.name + ": " + highScore)
                    }
                }
            }
        }
    }
}

struct ThemeChooserView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(numOfDecks: 1)
    }
}
