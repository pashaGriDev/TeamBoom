//
//  GameStartView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 08.08.2023.
//

import SwiftUI

struct GameStartView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameModel

	// MARK: - UI

	var body: some View {
		VStack(alignment: .center) {
			Text("Нажмите “Запустить” чтобы начать игру")
				.font(.custom(CustomFonts.DelaGothicOne, size: 26))
				.foregroundColor(Color.violet)
				.frame(width: 300)
                .multilineTextAlignment(.center)
			Spacer()
			Image("bomb2")
			Spacer()
			Button("Запустить") {
				startGame()
			}
            .font(.custom(CustomFonts.DelaGothicOne, size: 20))
			.modifier(ButtonViewModifier())
			.padding(.bottom, 30)
		}
	}

	// MARK: - Methods

	private func startGame() {
		if gameModel.withBackgroundMusic {
			playSound(key: gameModel.backgroundSound, player: &player)
		}
		playSound(key: gameModel.tickSound, player: &player2)
		gameModel.askQuestion()
		gameModel.isPlaying.toggle()
        gameModel.isPaused = false
        gameModel.setUpTimer()
	}
}

// MARK: - Preview

struct GameStartView_Previews: PreviewProvider {
	static var previews: some View {
		GameStartView(gameModel: GameModel())
	}
}
