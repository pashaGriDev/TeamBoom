//
//  PlaySound.swift
//  TeamBoom
//
//  Created by Artem on 08.08.2023.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!
var player2: AVAudioPlayer!

func playSound(key: String, player: inout AVAudioPlayer!) {
    let url = Bundle.main.url(forResource: key, withExtension: "mp3")

    guard url != nil else {
        return
    }
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("\(error)")
    }
}
