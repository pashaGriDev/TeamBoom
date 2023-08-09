//
//  GameProcessView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 08.08.2023.
//

import SwiftUI

struct GameProcessView: View {
	// MARK: - States&Properties

	@StateObject private var gameModel: GameModel

	// MARK: - Init

	init(gameModel: GameModel) {
		self._gameModel = StateObject(wrappedValue: gameModel)
	}

	// MARK: - UI

	var body: some View {
		VStack {
			Text(gameModel.question)
				.font(.title.bold())
				.foregroundColor(Color.violet)
				.frame(width: 300)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 10)
			Spacer()
			LottieView(name: "animation1",
					   loopMode: .playOnce,
					   animationSpeed: 7.76/gameModel.gameTime,
					   isPaused: gameModel.isPaused)
				.frame(width: 500, height: 500)
				.scaleEffect(1)
				.saturation(1.7)
				.animation(.easeIn, value: gameModel.isPlaying)
			Spacer()
			Button("Пауза") {
				pauseGame()
			}
			.modifier(ButtonViewModifier())
			.padding(.bottom, 30)
		}
	}

	private func pauseGame() {
		if !gameModel.isPaused {
			gameModel.isPaused = true
			player.stop()
			player2.stop()
		} else {
			gameModel.isPaused = false
			player.play()
			player2.play()
		}
	}
}

// MARK: - Preview

struct GameProcessView_Previews: PreviewProvider {
	static var previews: some View {
		GameProcessView(gameModel: GameModel())
	}
}
