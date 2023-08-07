//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {

    @State private var isGame = false
    var gameTime = 7.0

    var body: some View {
        ZStack {
            BackgroundGradientView()
                    if isGame {
                        LottieBombView(name: "animation1", loopMode: .playOnce, animationSpeed: 7.8/gameTime)
                            .scaleEffect(1)
                                 .saturation(1.7)
                                 .animation(.easeIn, value: isGame)
                         }
            VStack {
                Spacer()
                Button("Start Game") {
                    isGame.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + gameTime) {
                            isGame.toggle()
                    }
                }
                .padding(.bottom, 30)
                .opacity(isGame ? 0 : 1)
                .offset(x: isGame ? 100 : 0)
                .animation(.default, value: isGame)
                }
            }
        }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
