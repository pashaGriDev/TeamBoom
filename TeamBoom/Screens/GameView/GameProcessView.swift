//
//  GameProcessView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 08.08.2023.
//

import SwiftUI

struct GameProcessView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameViewModel

	// MARK: - UI

	var body: some View {
		ZStack(alignment: .center) {
			LottieView(name: "animation1",
					   loopMode: .playOnce,
					   animationSpeed: 7.75/gameModel.gameTime,
					   isPaused: gameModel.isPaused, progress: gameModel.count/gameModel.gameTime)
			.frame(width: 500, height: 500)
			.scaleEffect(1)
			.saturation(1.7)
			.animation(.easeIn, value: gameModel.isPlaying)
			VStack {
				Text(gameModel.question)
					.font(.title.bold())
					.foregroundColor(Color.violet)
					.frame(width: 300, alignment: .bottom)
					.fixedSize(horizontal: false, vertical: true)
					.multilineTextAlignment(.center)
					.padding(.horizontal, 10)
					.offset(y: 20)
					.minimumScaleFactor(0.7)
				Spacer()
				Button(gameModel.isPaused ? "Продолжить" : "Пауза") {
					pauseGame()
				}
				.buttonStyle(GameButtonModifier())
				.padding(.bottom, 30)
				.animation(.default, value: gameModel.isPaused)
			}
			.padding(.bottom, 30)
		}
	}
}

// MARK: - Methods

extension GameProcessView {
	private func pauseGame() {
		if !gameModel.isPaused {
			gameModel.isPaused = true
			player2.pause()
			if gameModel.withBackgroundMusic {
				player.pause()
			}
		} else {
			gameModel.isPaused = false
			gameModel.setUpTimer()
			player2.play()
			if gameModel.withBackgroundMusic {
				player.play()
			}
		}
	}
}

// MARK: - Preview

struct GameProcessView_Previews: PreviewProvider {
	static var previews: some View {
		GameProcessView(gameModel: GameViewModel())
	}
}
