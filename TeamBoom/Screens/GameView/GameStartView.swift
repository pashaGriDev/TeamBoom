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

	// MARK: - Init

	init(gameModel: GameModel) {
		self._gameModel = StateObject(wrappedValue: gameModel)
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
		playSound(key: "backgroundMusic", player: &player)
		playSound(key: "ticking", player: &player2)
		gameModel.askQuestion()
		gameModel.isPlaying.toggle()

		DispatchQueue.main.asyncAfter(deadline: .now() + 0.95 * gameModel.gameTime) {
			playSound(key: "explosion", player: &player)
			player2.stop()
		}

		DispatchQueue.main.asyncAfter(deadline: .now() + gameModel.gameTime) {
			gameModel.isOver.toggle()
			gameModel.getPunishment()
		}
	}
}

// MARK: - Preview

struct GameStartView_Previews: PreviewProvider {
	static var previews: some View {
		GameStartView(gameModel: GameModel())
	}
}
