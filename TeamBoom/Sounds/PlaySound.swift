//
//  PlaySound.swift
//  SolfaDrill(prototype)
//
//  Created by Artem on 03.06.2023.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!
var player2: AVAudioPlayer!

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

func playSound2(key: String) {
    let url = Bundle.main.url(forResource: key, withExtension: "mp3")
    // Do nothing if this url is empty
    guard url != nil else {
        return
    }
    do {
        player2 = try AVAudioPlayer(contentsOf: url!)
        player2?.play()
    } catch {
        print("\(error)")
    }
}
