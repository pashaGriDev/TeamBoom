//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {

    @State private var isGame = false
    @State private var isOver = false
    @State private var question = "How are you man? ddddddddoooppp"
    @State private var punishment = "Punishment"
    var gameTime = 7.0

    var body: some View {
        ZStack {
            BackgroundGradientView()
                    if isGame {
                        LottieBombView(name: "animation1", loopMode: .playOnce, animationSpeed: 7.76/gameTime)
                            .scaleEffect(1)
                                 .saturation(1.7)
                                 .animation(.easeIn, value: isGame)
                         }
            VStack {
                Text(question)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                    .opacity(isGame ? 1 : 0)
                    .offset(y: isGame ? 30 : -100)
                    .animation(.easeIn(duration: 0.8), value: isGame)
                if isOver {
                    Text(punishment)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .opacity(isGame ? 0 : 1)
                        .offset(y: isGame ? 30 : -100)
                }
                Spacer()
                Button("Start Game") {
                    isOver = false
                    isGame.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + gameTime) {
                            isOver.toggle()
                            isGame.toggle()
                            
                    }
                }
                .modifier(ButtonViewModifier())
                .padding(.bottom, 30)
                .opacity(isGame ? 0 : 1)
                .offset(x: isGame ? 300 : 0)
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
