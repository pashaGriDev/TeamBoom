//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {

    @State private var isGame = false

    var body: some View {
        ZStack {
            BackgroundGradientView()
                    if isGame {
                        LottieBombView(name: "animation1", loopMode: .playOnce, animationSpeed: 1)
                                 .scaleEffect(1)
                                 .saturation(1.7)
                         }
            VStack{
                Spacer()
                Button("Start Game") {
                    isGame.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7.8) {
                        withAnimation() {
                            isGame.toggle()
                        }
                    }
                }
                .padding(.bottom, 30)
       
                }
            }
        }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
