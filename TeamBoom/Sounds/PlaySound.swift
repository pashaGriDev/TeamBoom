//
//  PlaySound.swift
//  SolfaDrill(prototype)
//
//  Created by Artem on 03.06.2023.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound(key: String) {
    let url = Bundle.main.url(forResource: key, withExtension: "mp3")
    // Do nothing if this url is empty
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
