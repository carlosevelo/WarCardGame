//
//  SoundPlayer.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/13/22.
//

import Foundation
import AVFoundation

struct SoundPlayer {
    var player: AVAudioPlayer?

    mutating func playSound(named soundName: String) {
        guard let path = Bundle.main.url(forResource: soundName, withExtension: nil) else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: path)
            player?.play()
        } catch {
            // Ignore -- just don't try to play the sound
        }
    }
}
