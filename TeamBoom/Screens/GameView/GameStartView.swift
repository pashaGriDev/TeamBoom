//
//  GameStartView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 08.08.2023.
//

import SwiftUI

struct GameStartView: View {
	// MARK: - States&Properties

	@StateObject private var gameModel: GameModel
	private let gameTime: Double

	// MARK: - Init

	init(gameModel: GameModel, gameTime: Double) {
		self._gameModel = StateObject(wrappedValue: gameModel)
		self.gameTime = gameTime
	}

	// MARK: - UI

	var body: some View {
		VStack(alignment: .center) {
			Text("Нажмите “Запустить” чтобы начать игру")
				.font(.title.bold())
				.foregroundColor(Color.violet)
				.frame(width: 300)
				.multilineTextAlignment(.center)
			Spacer()
			Image("bomb2")
			Spacer()
			Button("Запустить") {
				startGame()
			}
			.modifier(ButtonViewModifier())
			.padding(.bottom, 30)
		}
	}

	// MARK: - Methods

	private func startGame() {
		playSound(key: "backgroundMusic")
		playSound2(key: "ticking")
		gameModel.askQuestion()
		gameModel.isPlaying.toggle()

		DispatchQueue.main.asyncAfter(deadline: .now() + 0.95 * gameTime) {
			playSound(key: "explosion")
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + gameTime) {
			gameModel.isOver.toggle()
			gameModel.getPunishment()
		}
	}
}

// MARK: - Preview

struct GameStartView_Previews: PreviewProvider {
	static var previews: some View {
		GameStartView(gameModel: GameModel(), gameTime: 5.0)
	}
}
